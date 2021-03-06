function Do_MPC_Exp()

%Experiment running for the MPC experiment. 
global EXPWIN RESOURCEFOLDER DATAFILE 

%MPP specific objects
global CONDITION TOEXTEND EXTENDCONDITION MAIN_ITEMS EXT_ITEMS STARS

%Some numeric versions of condition names for indexing into tables...

switch CONDITION
    case 'Manner'
        conditionno = 1;
    case 'Path'
        conditionno = 3;
%     case 'Action'
%         conditionno = 6;
%     case 'Effect'
%         conditionno = 5; %(yes #s reversed between domains for now)
end

%switch TOEXTEND
%     case 'NoExtend'
%         toExtend = 0;
%     otherwise
%         toExtend = 1;
% end

try
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%
    %READ IN AND RANDOMIZE ALL FILES FOR THE EXPERIMENT!
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    vidInfo = readtable('MPC_videos.csv');
    MAIN_ITEMS = vidInfo(vidInfo.List == conditionno,:);
    
%     if toExtend %Assign the other-domain set! Since we don't do any learning, arbitrarily get Manner or Action
%         if(conditionno == 1 || conditionno == 3) %Start with MannerPath, move to Action
%             EXTENDCONDITION = 'Action';
%             EXT_ITEMS = vidInfo(vidInfo.List == 6,:);
%         elseif (conditionno == 5 || conditionno == 6) %Start with ActionEffect, move to Manner
%             EXTENDCONDITION = 'Manner';
%             EXT_ITEMS = vidInfo(vidInfo.List == 1,:);
%         end
%     end
    
    %Randomize the order of the items
%     MAIN_ITEMS = MAIN_ITEMS(randperm(height(MAIN_ITEMS)), :);
%     if toExtend
%         EXT_ITEMS = EXT_ITEMS(randperm(height(EXT_ITEMS)), :);
%     end
    
    %Add the star pictures _in order!!!_
    %if TOEXTEND
        %myStars = dir([RESOURCEFOLDER '/stars/longstars*.jpeg']);
        %myStars = struct2cell(myStars);  
        %myStars(1,:) = strcat('stars/',myStars(1,:));
        %STARS.noun = myStars(1,1:3);
        %STARS.main = myStars(1,4:11);
        %STARS.ext = myStars(1,12:19);
    %else
        %myStars = dir('stars/stars*.jpg');
        %myStars = struct2cell(myStars);
        %myStars(1,:) = strcat('stars/',myStars(1,:));
        %STARS.noun = myStars(1,1:3);
        %STARS.main = myStars(1,4:11);
    %end
    
    %Randomize the side presentation of the items
    %(Counterbalancing note: left video always plays first, assignment is
    %to play either the M or P video first.  Remember that we use
    %manner/path as the example case, you might be showing action/effect
    %really...
    
    %verbose code for readable output!
   
    screenside = ['LR';'LR';'LR';'LR';'RL';'RL';'RL';'RL'];
    
    screenside = screenside(randperm(8),:);
    MAIN_ITEMS.BiasManner = screenside(:,1);
    MAIN_ITEMS.BiasPath = screenside(:,2);
    
    screenside = screenside(randperm(8),:);
    MAIN_ITEMS.TestManner = screenside(:,1);
    MAIN_ITEMS.TestPath = screenside(:,2);
    
%     if toExtend
%         screenside = screenside(randperm(8),:);
%         EXT_ITEMS.BiasManner = screenside(:,1);
%         EXT_ITEMS.BiasPath = screenside(:,2);
%         
%         screenside = screenside(randperm(8),:);
%         EXT_ITEMS.TestManner = screenside(:,1);
%         EXT_ITEMS.TestPath = screenside(:,2);
%     end
    
    %%%%%%%%%%%%%%%%%%%%%
    % EXPERIMENT STARTS HERE
    %%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Save a header file to the data file so it will be easier to read!
    WriteToDataFile({'header','asdf','putcolumnnameshere', 12}); %use curly braces, ANYthing could be in there!
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Text_Show('Press spacebar to start the MPC experiment. It should play noun trials and then crash!')
    %Take_Response();
    %Show_Blank();
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % GET READY....
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Play_Sound(strcat(RESOURCEFOLDER, '/audio/aa_motivation/getready.wav'), 'toBlock');
    Show_Blank();

    %Show_Image(strcat(RESOURCEFOLDER, '/', STARS.noun{1}));
    
    %Take_Response();
    %Show_Blank;

      
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % 3 TRIALS OF SHAPE TRAINING
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   

    %MPC_Shape_Training();

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % 8 MAIN BLOCK TRIALS 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Trial_Main();
    
    %MK NOTE 6/30/2017 - code below here probably doesn't work!
    
    %Number of trials
    parameters.ntrials = 8;
    
    Text_Show('READY? Press space.');
    Take_Response();
    
    %And actually play the trials! Data is saved on each round to allow for
    %partial data collection
    for i=1:parameters.ntrials
        Trial_Main(i)
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Write result file
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        Write_Trial_to_File(i, MAIN_ITEMS);

    end
    
    %And do the same for the Extension trials, if we're doing that!
%     for i=(parameters.ntrials+1):(2*parameters.ntrials)
%         Trial_Extend(i);
%         expEnd = GetSecs;
%         parameters.totalTime = expEnd - parameters.expStart;
%         Write_Trial_to_File(i, EXT_ITEMS);
%     end
    
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Cleanup & Shutdown
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        Closeout_PTool();
        

catch 
    Closeout_PTool();
    psychrethrow(psychlasterror);
    
end

end


     