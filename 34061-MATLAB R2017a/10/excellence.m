%计算个体繁殖概率
function exc=excellence(individuals,M,ps)
fit = 1./individuals.fitness;
sumfit = sum(fit);
con = individuals.concentration;
sumcon = sum(con);
for i=1:M
    exc(i) = fit(i)/sumfit*ps +con(i)/sumcon*(1-ps); 
end

end