% use permCCA to run partial CCA
% for mh of full 31 items
% eg, test X-Y while controlling for Z
clear all; close all; clc

addpath('~/Scripts/matlab/PermCCA-master')
% addpath('~/Scripts/matlab/myScripts')

% id cluster version eg chpc2.0 vs chpc3.0
wkdir = '/scratch/weiz/projects/ukb_phyama';
% if ~exist(wkdir, 'dir')
%   wkdir = '/scratch/wzzang/projects/ukb_phyama';
% end

% whether first or second run
% firstrun = 1: initial run to identify sig cc
% firstrun = 0: test loading significance for identfied sig cc
firstrun = 0 ;
mddir = 'full_model';


% get data
files = dir(fullfile(wkdir,'stats',mddir,'*org.csv'));
% pcafile = fullfile(wkdir,'stats',mddir,'mh_pca_score.csv');
data = cell(length(files),2);
for f = 1:length(files)
  filename = fullfile(wkdir, 'stats', mddir,files(f).name);
  data{f,1} = files(f).name;
  data{f,2} = readmatrix(filename);
end


for f = 1:length(data)
  if contains(data{f,1}, 'confs')
    ZZ = data{f, 2};

  elseif contains(data{f,1}, 'brain')
    Y = data{f, 2};
  elseif contains(data{f,1}, 'mh')
    Xmh = data{f, 2};
  else
    Xphy = data{f, 2};
  end
end

% set up model for mh and phy
outs = cell(4,1);
nK = [2 3 2 2]; % sig nCV in each model

% if firstrun
%   nk = [];
% end


for m = 1:4
  Z = ZZ;
  if m<=2
    md = 'phy';
    X = Xphy;

    if m == 2
      Z = horzcat(ZZ, Xmh);
    end

  else
    md = 'mh';
    X = Xmh;

    if m == 4
      Z = horzcat(ZZ, Xphy);
    end

  end

  if nK(m) > 0
    nk = nK(m);
  else
    nk = [];
  end

  % run model
  % run model
  disp(['Running model ', num2str(m), ' for ', md])
  if firstrun
    disp('.. for the initial model')

    [outs{m}.p,outs{m}.r,outs{m}.A,outs{m}.B,outs{m}.U,outs{m}.V] = permcca(Y,X,1000,Z);
  else
    % run for loading
    disp('.. for the loadings')
    if ~isempty(nk)
      [outs{m}.p,outs{m}.r,outs{m}.A,outs{m}.B,outs{m}.U,outs{m}.V,outs{m}.loadAp,outs{m}.loadBp] = permloads(Y,X,1000,Z,nk);
    else
      disp(['skipping model ', m])
    end
  end

end



% save output
if firstrun
  otname = fullfile(wkdir,'stats',mddir,'permCCA_outs_mh-full.mat');
else
  otname = fullfile(wkdir,'stats',mddir,'permCCA_outs_loadings_mh-full.mat');
end
% otname = fullfile(wkdir,'stats','permCCA_outs_Apermed.mat');
save(otname, 'outs')
disp('Output saved!')


%%%%%%% output csv for posthoc analyses %%%%%%%
if firstrun
  mdnames = ["phy-brain" "phy-brain_mh" "mh-brain" "mh-brain_phy"];
  for m = 1:length(mdnames)
    dt = outs{m};
    % write out csv file contains all r-p-A-B-U-V in order
    % note, ncol = p (when p<q); nrow = stacked vars or subs
    tmp = vertcat(dt.r, dt.p, dt.A, dt.B, dt.U, dt.V);
    otname = strcat('model_',mdnames(m),'.csv');
    writematrix(tmp, fullfile(wkdir,'stats',mddir, otname))
  end
end
% test col-wise corr between two output matrices
% % with or without normalizing input data
% ncols = size(A1,2);
% for c = 1:ncols
%   dt1 = A1(:,c);
%   dt2 = A2(:,c);
%   [r,p] = corrcoef(dt1,dt2);
%   disp(['CV ', num2str(c), ' corr=', num2str(r(1,2)), '; p=', num2str(p(1,2))])
% end

% run fdr for loadings
% nmd = length(outs);
% nCV = [2 2 2 1];
% loadouts = cell(nmd,1);
% adjPs = zeros(1, max(nCV)+2) ;
% for m = 1:nmd
%   ids = 1:nCV(m);
%   % extract all p for A loadings
%   Ps = outs{m}.loadAp(:,ids);
%   % vectorize columns
%   Pvecs = Ps(:);
%   [loadouts{m}.pthr,loadouts{m}.pcor,loadouts{m}.padj] = fdr(Pvecs);
%   % reshape adjusted p into x by nCV
%   Ps = reshape(loadouts{m}.padj, [], nCV(m));
%   if length(ids)<max(nCV)
%     Ps = horzcat(Ps, repmat(0,size(Ps,1),(max(nCV)-length(ids))));
%   end
%   % adding brain var ind & model number
%   Ps = horzcat((1:(size(Ps,1)))', Ps, repmat(m,size(Ps,1),1));
%   % concatenating data
%   adjPs = vertcat(adjPs, Ps);
%
% end
% adjPs(1,:) = [];
% otname = strcat('loadings_adjPs.csv');
% writematrix(adjPs, fullfile(wkdir,'stats',otname))

% extract loadings per model
if ~firstrun
  nmd = length(outs);
  nCV = max(nK); % extract the upper end numb of CVs
  A_ld_pvalues = zeros(1, (nCV+1));
  B_ld_pvalues = zeros(1, (nCV+1));
  for m = 1:nmd
    a_values = outs{m}.loadAp(:,1:nCV);
    b_values = outs{m}.loadBp(:,1:nCV);
    %
    idx = repmat(m,1,size(a_values,1));
    As = horzcat(a_values, idx');
    idx = repmat(m,1,size(b_values,1));
    Bs = horzcat(b_values, idx');
    % stack results
    A_ld_pvalues = vertcat(A_ld_pvalues, As);
    B_ld_pvalues = vertcat(B_ld_pvalues, Bs);
  end
  A_ld_pvalues(1,:) = []; B_ld_pvalues(1,:) = [];
  loading_pvalues = vertcat(A_ld_pvalues, B_ld_pvalues);
  % first nrow 28*4 = brain vars
  otname = 'loadings_pvalues.csv';

  writematrix(loading_pvalues, fullfile(wkdir,'stats',mddir,otname))
end
