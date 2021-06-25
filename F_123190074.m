clc;clear;

data = xlsread('Real estate valuation data set.xlsx','C2:E51');
harga = xlsread('Real estate valuation data set.xlsx','H2:H51');

x = [data harga];
k = [1,0,1,0];
w = [3,5,4,1];

[a,b]=size (x);
w=w./sum(w);

for j=1:b
    if k(j)==0, w(j)=-1*w(j);
    end
end
for i=1:a
    S(i)=prod(x(i,:).^w);
end %melakukan perhitungan vektor per baris

for i=1:a
    V(i) = S(i)/sum(S);
end
nilai = sort(V,'descend'); %memperingkatkan dan mengurutkan dari nilai yang terbesar

for i=1:a
    for j=1:a
        if(nilai(i) == V(j))
        nomor(i) = j; 
        break
        end
    end 
end %mencari urutan nomor sesuai dengan data yang ada
