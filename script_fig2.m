clear all
close all
clc


load vari2
f = figure; 
% f.Position = [800 300 900 450]; 
f.Position = [800 300 450 650]; 
Markers = {'+','o','*','x','v','d','^','s','>','<','p','h'};
lineStyles = {'-', '--', ':', '-.', '-', '--', ':', '-.'};
lineWidths = [3, 1.5, 1.5, 1.5, 1.5, 2.5, 2.5, 2.5];
% c = lines(16);
c = [0, 0, 0;  % MATLAB default blue
          0.8500, 0.3250, 0.0980; % MATLAB default orange
          0.9290, 0.6940, 0.1250; % MATLAB default yellow
          0.4940, 0.1840, 0.5560; % MATLAB default purple
          0.4660, 0.6740, 0.1880; % MATLAB default green
          0.3010, 0.7450, 0.9330; % MATLAB default light blue
          0.6350, 0.0780, 0.1840; % MATLAB default red
          0, 0.4470, 0.7410];               % Black

subplot_tight(2,1,1,[0.11,0.11]); 
for j= 1:8
    plot(2:8,vari2(j,2:8)'*100, 'Marker',Markers{j},'Color', c(1*j,:), "MarkerSize",5,...
        'LineStyle', lineStyles{j},  'LineWidth', lineWidths(j)); hold on;
end
xlabel({'No of Principal Components','(a)'}) 
ylabel('Explained variance')
grid on
legend('PCA+ICA', 'PPCA+ICA', 'SPCA+ICA', 'PMD', 'GPower', 'DPCA1a', 'DPCA1b',...
        'DPCA2', 'Location', 'Southeast')

%%

% figure; plot(F_score')

load F_score
% F_score = F_score';
FFscore = mean(F_score,3)';

Markers = {'+','o','*','x','v','d','^','s','>','<','p','h'};
lineStyles = {'-', '--', ':', '-.', '-', '--', ':', '-.'};
lineWidths = [3, 1.5, 1.5, 1.5, 1.5, 2.5, 2.5, 2.5];
% c = lines(16);
tstd  = ([0.25:0.25:1.25]);
c = [0, 0, 0;  % MATLAB default blue
          0.8500, 0.3250, 0.0980; % MATLAB default orange
          0.9290, 0.6940, 0.1250; % MATLAB default yellow
          0.4940, 0.1840, 0.5560; % MATLAB default purple
          0.4660, 0.6740, 0.1880; % MATLAB default green
          0.3010, 0.7450, 0.9330; % MATLAB default light blue
          0.6350, 0.0780, 0.1840; % MATLAB default red
          0, 0.4470, 0.7410];               % Black
subplot_tight(2,1,2,[0.11,0.11]); 
for j= 1:8
    plot(tstd, FFscore(:,j)', 'Marker',Markers{j},'Color', c(1*j,:), "MarkerSize",5,...
        'LineStyle', lineStyles{j},  'LineWidth', lineWidths(j)); hold on; 
end
xlabel({'Noise Varaince','(b)'})
ylabel('F-score')
grid on
axis([0.24 1.26 0.6 0.95])
exportgraphics(gcf,'khali2.png','Resolution',300)

% tstd  = sqrt([0.25:0.25:1.25]); %0.1  
% sstd  = sqrt([0.001:0.004:0.02])
