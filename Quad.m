clear all��
Q0=[0,0,0,1];%��ʼλ��x=0,y=0,z=1
Q0_n=quatnormalize(Q0);%��λ��

yaw1=deg2rad(0);
pitch1=deg2rad(0);
roll1=deg2rad(60);%��X��ת��+60��
dcm=angle2dcm(yaw1,pitch1,roll1,'ZYX');
Q0_dcm=dcm.*[0,0,1];
q1= angle2quat(yaw1, pitch1, roll1,'ZYX');
q1_=quatconj(q1);%�����λ��Ԫ���Ĺ��������ȣ���ΪA*=A_ / ||A||,��ʾ��ת����Ԫ�����ǵ�λ��Ԫ��
%q1_=quatinv(q1)
Q1=quatmultiply(quatmultiply(q1,Q0),q1_);%��3��Ԫ�ش���λ��

yaw2=deg2rad(0);
pitch2=deg2rad(0);
roll2=deg2rad(-60);%��X��ת��-60��,ת��ȥ��

 q2= angle2quat(yaw2, pitch2, roll2,'ZYX');
%q2= angle2quat(roll2, pitch2, yaw2,'XYZ');
q2_=quatconj(q2);

Q2=quatmultiply(quatmultiply(q2,Q1),q2_);%Q2Ӧ�õ���Q0
 
q3=quatmultiply(q1,q2);%2����Ԫ����ת��Ϊһ��
q3_=quatconj(q3);
Q3=quatmultiply(quatmultiply(q3,Q0),q3_);%Q3Ӧ�õ���Q2��Q0
 
