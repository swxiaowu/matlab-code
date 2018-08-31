function state=gaplotbest(options,state,flag)
if size(state.Score,2)>1
    title('Best Fitness Plot:not available','interp','none');
    return;
end
switch flag
    case 'init'
        hold on;
        set(gca,'xlim',[0,options.Generations]);
        xlabel('Generation','interp','none');
        ylabel('Fitness value','interp','none');
        plotBest=plot(state.Generation,min(state.Score),'r.');
        set(plotBest,'Tag','gaplotbestf');
        plotMean=plot(state.Generation,meanf(state.Score),'k.');
        set(plotMean,'Tag','gaplotmean');
        title('[Best:',',Mean:'],'interp','none');
    case 'iter'
        best=min(state.Score);
        m=meanf(state.Score);
        plotBest=findobj(get(gca,'Children'),'Tag','gaplotbestf');
        plotMean=findobj(get(gca,'Children'),'Tag','gaplotmean');
        newX=[get(plotBest,'Xdata') state.Generation];
        newY=[get(plotBest,'Xdata') best];
        set(plotBest,'Xdata',newX,'Ydata',newY);
        newY=[get(plotMean,'Ydata'),m];
        set(plotMean,'Xdata',newX,'Ydata',newY);
        set(get(gca,'Title'),'String',sprintf('Best: %g Mean: %g',best,m));
    case 'done'
        LegnD=legend('Best fitness','Mean fitness');
        set(LegnD,'FontSize',8);
        hold on;
end
