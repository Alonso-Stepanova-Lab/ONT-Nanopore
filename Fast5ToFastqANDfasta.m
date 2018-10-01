fastafile=[];
fasta1={};
[filename, pathname] = uigetfile({'*.fast5'},'File Selector');
Files=dir(pathname); %all files in a directory
N={Files.name};
for i = 1:length(Files)
    W = ~isempty(strfind(N(i),'fast5'));
        if W
           file=strcat(pathname,N(i));
           file=cell2mat(file);
%            c=strsplit(file,'_');
%            read=char(c{end-3});
           atributo=strcat('/Analyses/Basecall_1D_000/BaseCalled_template/Fastq');
           data1=h5read(file,atributo);
           fasta=split(data1,'Z');
           fasta1{i*2-1,1}=strcat('>',file);
           fasta2=split(fasta(2,1),'+');
           fasta1{i*2,1}=fasta2(1,1);   
           fastq{i*2-1,1}=strcat('>',file);
           fastq{i*2,1}=fasta(2,1);
           
        end
end

destino=strcat(pathname,'fasta.txt');
destino1=strcat(pathname,'fastq.txt');
writetable( cell2table(fasta1), destino, 'writevariablenames', false, 'quotestrings', true);
writetable( cell2table(fastq), destino1, 'writevariablenames', false, 'quotestrings', true);