function  NurbsGetPose(k,iSegment,SumPoint, p, w, u)
	NowU=0;
 	Segment = iSegment + k-1 ;
	DeltaU = 1.0 / SumPoint;
for i = k:1: Segment
		Add1 = i + 1;
	while (NowU < u(1,Add1+1)) 
            tempp=zeros(4,3);
            tempw=zeros(1,4);
            for m = 1:1:4
				tempp(m,:)=p(i-k+m,:);
				tempw(1,m)= w(1,i-k+m);
            end
			for l = 0:1:k-1
                    for j = 0:1:k - l-1
                        if (u(1,1+i - j + k - l) - u(1,1+i - j))==0
                            Alj=0;
                        else
                            Alj = (NowU- u(1,i-j+1))/ (u(1,1+i - j + k - l) - u(1,1+i - j));
                        end
                        temp0 = tempw(1,1+k - j);
                        tempw(1,k - j+1) = (1 - Alj)* tempw(1,k - j) + Alj * tempw(1,1+k - j);
                        temp1 = temp0 / tempw(1,1+k - j);
                        temp2 = tempw(1,k - j)/tempw(1,1+k - j);
                        tempp(k - j+1,:) = (1 - Alj)* temp2*tempp(k - j,:) + Alj * temp1*tempp(k - j+1,:);
                    end
            end
            plot3(tempp(4,1),tempp(4,2),tempp(4,3),'.r');
            hold on;
            NowU = NowU + DeltaU;
    end
end
end
