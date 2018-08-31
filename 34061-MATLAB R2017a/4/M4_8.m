clear all;
one=[-1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 -1 -1 -1;...
    -1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 -1 -1 -1;...
    -1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 -1 -1 -1;...
    -1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 -1 -1 -1;...
    -1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 -1 -1 -1];
 two=[-1 1 1 1 1 1 1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
     -1 -1 -1 -1 -1 -1 -1 -1 1 1;-1 -1 -1 -1 -1 -1 -1 -1 1 1;...
     -1 1 1 1 1 1 1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
     -1 1 1 -1 -1 -1 -1 -1 -1 -1;-1 1 1 -1 -1 -1 -1 -1 -1 -1;...
     -1 1 1 1 1 1 1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1];
T=[one;two]';   %利用这两个数字点阵构成训练样本T
 net=newhop(T); %利用newhop函数创建一个离散型Hopfield神经网络
 
  noisy_one=[-1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 -1 1 -1 1 -1 -1 -1 -1 -1;...
    -1 -1 1 -1 1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 1 -1 -1 -1;...
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 1 -1 -1;...
    -1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 1 -1 -1 1 1 -1 -1 -1 -1;...
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 -1 1 -1];
 noisy_two=[-1 1 1 1 -1 1 1 -1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
     -1 -1 1 -1 1 -1 -1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
     -1 1 1 1 1 1 1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
     -1 1 1 -1 -1 -1 -1 -1 -1 -1;-1 1 1 -1 -1 -1 -1 -1 -1 -1;...
     -1 1 1 1 -1 1 1 1 1 -1;-1 1 1 -1 1 1 1 1 1 -1];

 %随机噪声
noisy_one=one;
noisy_two=two;
for i=1:100
    a=rand;
    if a<0.15
        noisy_one(i)=-one(i);
        noisy_two(i)=-two(i);
    end
end

%仿真测试 
noisy_one2={(noisy_one)'};
identify_one=sim(net,{10,10},{},noisy_one2);
identify_one{10}'           %获取复原后数字1点阵
noisy_two2={(noisy_two)'};
identify_two=sim(net,{10,10},{},noisy_two2);
identify_two{10}'              %获取复原后数字2点阵
%以图形的形式将点阵数字绘制出
subplot(3,2,1);one=imresize(one,20);
imshow(one);title('原始数据1');
subplot(3,2,2);two=imresize(two,20);
imshow(two);title('原始数据2');
subplot(3,2,3);noisy_one=imresize(noisy_one,20);
imshow(noisy_one);title('带噪声数字1');
subplot(3,2,4);noisy_two=imresize(noisy_two,20);
imshow(noisy_two);title('带噪声数字2');
subplot(3,2,5);one2=imresize(identify_one{10}',20);
imshow(one2);title('复原数字1');
subplot(3,2,6);two2=imresize(identify_two{10}',20);
imshow(two2);title('复原数字2');	

