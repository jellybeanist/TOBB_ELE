%QUESTION 1
%at the command window, I wrote the code "load('FMsignal.mat')" and .mat
%file loaded successfully. I saw the time series at the workspace and it was
%filled with numbers.

%QUESTION 2
%I opened the plotfft.m at the next tab to be able to use our function. When I used the
%function with the sampling rate of 40.000 and u, function ran succesfully
%and output was Fourier Transform of the signal.
Fs=40000;
plotfft(u,Fs);
xlabel('frequency') 
ylabel('u(F)')
title ('Fast Fourier Transform of "u"');

disp('as we can show from the figure we plotted, carrier frequency is approximately 4kHz.');

%QUESTION 3
%At this part I took the derivative of the FM signal with the "diff"
%function. Then plotted the graph.
figure
plot(diff(u));
title('Differential of u');
diffArray=diff(u);

%QUESTION 4
%I passed the resulting derivative from envelope detector. Here is the
%algoritm as described on the mail: if input (after derivation) signal is
%bigger than output (envelope), output catches input. Else, it will be
%subtracted with last output*(exp(Fs/tau). With for loop and if-else blocks
%I calculated the envelope. 

diff_size = length(diffArray);
diffArray = diff(u);
diffArray = [0 diffArray];
Voltage=zeros(1,diff_size);
tau=1.08*10^4;

for i = 2:diff_size
    if diffArray(i) > Voltage(i-1)
        Voltage(i)=diffArray(i);
        
    elseif diffArray(i) < Voltage(i-1)
        
        Voltage(i) = Voltage(i-1)-(Voltage(i-1)*(exp(-40000/tau)));
    end
end
figure
plot(Voltage);
title('Capacitor Voltage');

%QUESTION 5
%I calculated the average of envelop and then subtract it from envelop to
%eliminate DC offset.
DC=sum(Voltage)/numel(Voltage);
DCElimination=Voltage-DC;
figure
plot(DCElimination);
title('After DC Elimination');
    
%QUESTION 6
%We were asked to group envelope for each 1280 sample. In my workplace,
%signal after elimination is an array of double (1x394240).
%394240/1280=308. Now I need to calculate each of that 308 grouped samples
%average. While grouping, reshape function is what we need. And it is
%allowed us to use.

groups=reshape(DCElimination,308,1280);
varicode=zeros(1,308);
averageOfGroups=zeros(1,308);
for i=1:308
    averageOfGroups = sum(groups(i,1280))/1280;
    fprintf(averageOfGroups);
    if averageOfGroups(i) > 0
        varicode(i)=1;
    elseif averageOfGroups(i) < 0
        varicode(i)=0;
    end
    
end
figure
plot(varicode);

disp('Sizin de ramazan bayraminiz kutlu olsun hocam, sonuca ulasamadim ancak ulasan arkadaslar soyledi');
