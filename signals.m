%example of machine learning to find specif frequency signals in a array of
%samples

%format (examples,ns) where ns is the number of signals to predict
%input(examples,ns) data to be fed to ML
%y(examples,ns) data to be compared
%n has the sampling frequency -> has the size of input layer

%samples
n = 0:0.001:0.249;
ns = 3;
examples = 1000;

%basic signals to identify
x1 = sin(2*pi*60*n);
x2 = 0.5*sin(2*pi*120*n);
x3 = 2*sin(2*pi*20*n);
x = [x1;x2;x3];

%generating new signals
r = zeros(ns,1);
y = zeros(examples,ns);
input = zeros(examples,length(n));

%generate input and output
for i=1:examples
    %initialize r
    r = rand([ns,1])>0.5;
    y(i,:) = r; %if prob greater then 0.5 has signal
    input(i,:) = r'*x + (rand>0.5)*rand*3*sin(2*pi*rand*110*n);
end

