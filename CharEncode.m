function [encoded] = CharEncode(rem, testlist)
    for iter = 1:length(testlist)
        testlist(3,iter) = floor(rem/double(testlist(1,iter)));
        rem = mod(rem, double(testlist(1,iter)));
    end
    help = testlist(3,:);
    help(isnan(double(help)))=0;
    testlist(3,:)=help;
    for iter = 1:length(testlist)
        if double(testlist(3,iter)) ~= 0
        testlist(4,iter) = strjoin(repmat(testlist(2,iter),[1,double(testlist(3,iter))]), '');
        end
    end
    encoded = strjoin(testlist(4,:), '');
    end
    
