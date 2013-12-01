clear all;
close all;
clc
fs=4*pi;
y=rectwin(2*fs+1);
t=(-1:1/fs:1);
  figure(1);
 subplot(2,2,1); 
 plot(t,y);
 title('Rectangular Window');
 ylabel('Magnitude');
 xlabel('Time');
 axis([-3 3 -1 2.5]);
 grid;
 t=t';
 subplot(2,2,3);
 x=(1+cos(pi.*t)).*y;
 plot(t,x);
 xlabel('Time');
 title('Raised-Cosine Window');
 grid;
 axis([-3 3 -1 2.5]);
 subplot(2,2,2);
 [H,w]=freqz(y);
 wo=fs*w/(2*pi);
 plot(wo,abs(freqz(y)));
 title('Mag. spectra of Rect. Window');
 xlabel('Freq.');
 grid;
 axis([0 10 0 30]);
 subplot(2,2,4);
 plot(wo,abs(freqz(x)));
 title('Mag. Spectra of Raised-Cosine Window');
 xlabel('Freq.(Hz)');
 axis([0 10 0 30]);
 grid;
 display('x(t) is more smoother clearly from the frequency spectrum fig 1');
 %-----------------------------------------
 
 %---------------PART B------------------
 t=0:1/fs:1000;
 z=cos(2*pi*t);
 
 t1=0:1/fs:500;
 t2=500:1/fs:1000;
 z1=cos(2*pi*t1);
 z2=cos(2*pi*t2);
 
 y1=rectwin(500*fs+1);
 y1=y1';
 x1=(1+cos(pi.*t1)).*y1;
 
 ansz1=z1.*x1;
 ansz2=z2.*y1;
 figure(2);
 [H1,w1]=freqz(ansz1);
 wo1=fs*w1/(2*pi);
 subplot(3,1,1);
 
 plot(wo1,abs(freqz(ansz1)));
 title('Mag. Spectra of cos(2*pi*t) multiplied with raised cosine till 500sec'); 
 ylabel('Magnitude');
 subplot(3,1,2);
 
 plot(wo1,abs(freqz(ansz2)));
 title('Mag. Spectra of cos(2*pi*t) multiplied with rectangular window from 500sec to 1000 sec');
 subplot(3,1,3);
 plot(wo1,abs(freqz(z)));
 title('Mag. Spectra of cos(2*pi*t) for 1000 sec');
 xlabel('Freq.(Hz)');
%------------------------------------

% PART 3-------------------------------------------
load train.mat; % loads Fs and y variables
t1=(0:1000)/Fs  % Fs is samp freq of Train.mat
t2=(5000:6000)/Fs;
t3=(11800:12800)/Fs;

ynew=rectwin(1001);
ynew=ynew';
 xnew1=(1+cos(pi.*t1)).*ynew;
 xnew2=(1+cos(pi.*t2)).*ynew;
 xnew3=(1+cos(pi.*t3)).*ynew;
 xnew1=xnew1';
 xnew2=xnew2';
 xnew3=xnew3';
 
 ynew1=zeros(1001,1);
 ynew2=zeros(1001,1);
 ynew3=zeros(1001,1);
 for r=1:1000;
 ynew1(r,1)=y(r,:);
 end
 for r=5000:6000;
 ynew2(r-4999,1)=y(r,:);
 end
 for r=11800:12800;
 ynew3(r-11799,1)=y(r,:);
 end
 
 multiplied1=ynew1.*xnew1;
 multiplied3=ynew3.*xnew3;
 multiplied2=ynew2.*xnew2;
 figure(3);
 subplot(3,1,1);
 [Hvin,wvin]=freqz(multiplied1);
 wojam=Fs*wvin/(2*pi);
 plot(wojam,abs(freqz(multiplied1)));
 title('Mag. Spectra for first 0-1000 samples of Train');
 ylabel('Magnitude');
 subplot(3,1,2);
 
 plot(wojam,abs(freqz(multiplied2)));
 title('Mag. Spectra for 5000-6000 samples of Train');
 
 subplot(3,1,3);
 
 plot(wojam,abs(freqz(multiplied3)));
 title('Mag. Spectra for 11800-12800 samples of Train');
 xlabel('Freq.(Hz)');
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 %----------------------------------------
%B.S.Vineeth <b.vineeth@iitg.ernet.in>
%BTech EP, Class of 2016, NOV 2013, Copyright (c)
%----------------------------------------
