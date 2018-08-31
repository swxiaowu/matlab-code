function state=gaplotstopping(options,state,flag)
CurrentGen=state.Generation;
stopCriteria(1)=CurrentGen/options.Generations;
stopString{1}='Generation';
stopCriteria(2)=(cputime-state.StartTime)/options.TimeLimit;
stopString{2}='Time';
if isfield(state,'LastImprovement')
    stopCriteria(3)=(CurrentGen-state.LastImprovement)/options.StallGenLimit;
    stopString{3}='Stall(G)';
end

if isfield(state,'LastImprovementTime')
    stopCriteria(4)=(cputime-state.LastImprovement)/options.StallTimeLimit;
    stopString{4}='Stall(T)';
end

ydata=100*stopGriteria;
switch flag
    case 'init'
        barh(ydata,'Tag','gaplotstopping')
        set(gca,'xlim',[0,100],'yticklabel',stopString,'climmode','manual');
        xlabel('%of criteria met','interp','none');
        title('Stopping Criteria','interp','none');
    case 'iter'
        ch=findobj(get(gca,'Children'),'Tag','gaplotstopping');
        set(ch,'YData',ydata);
end
  
