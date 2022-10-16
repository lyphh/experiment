clear all;
% for kk=1:18
    %filename=['D:\GetSensorData\sample1\',num2str(kk),'.txt'];
    filename=['D:\GetSensorData\sample1\NoMag1.txt'];
%     filename=['D:\GetSensorData\sample1\swing156.txt'];
%     filename=['D:\GetSensorData\sample1\pocket154.txt'];
%     filename=['D:\GetSensorData\sample1\calling155.txt'];
    fid=fopen(filename);
    
    eupdata=textscan(fid,'%s%s%s%s%s%s%s%s%s%s','delimiter',';','Headerlines',36);
    fclose(fid);
    data=cell(1,7);
    j=1;
    for i=1:length(eupdata{1,1})
        if(strcmp(eupdata{1,1}{i,1},'ACCE')||strcmp(eupdata{1,1}{i,1},'MAGN')||strcmp(eupdata{1,1}{i,1},'GYRO')||strcmp(eupdata{1,1}{i,1},'AHRS'))
            data{j,1}=eupdata{1,1}{i,1};
            data{j,2}=eupdata{1,2}{i,1};
            data{j,3}=eupdata{1,3}{i,1};
            data{j,4}=eupdata{1,4}{i,1};
            data{j,5}=eupdata{1,5}{i,1};
%             if strcmp(eupdata{1,1}{i,1},'PRES')
%                 data{j,6}=[];
%                 data{j,7}=[];
%             else

                data{j,6}=eupdata{1,6}{i,1};
                data{j,7}=eupdata{1,7}{i,1};
%             end
            j=j+1;
        end
    end
%     filename=['D:\GetSensorData\sample1\',num2str(kk),'.xlsx'];
filename=['D:\GetSensorData\sample1\NoMag1.xlsx'];
xlswrite(filename,data);
% end