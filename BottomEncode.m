function [encoded] = BottomEncode(input)
    testlist = [200, 50, 10, 5, 1, 0; ":people_hugging:", ":sparkling_heart:", ":sparkles:", ":pleading_face:", ",", ":heart:"; NaN, NaN, NaN, NaN, NaN, NaN; "", "", "", "", "", ""];
    disp(unicode2native(input, 'UTF-8'))
    encodedList = []
    for iter = unicode2native(input, 'UTF-8')
        encodedList = [encodedList,CharEncode(double(iter), testlist)]
    end
    encoded = strcat(strjoin(encodedList,':point_right::point_left:'), ':point_right::point_left:');
end
