function [response] = Trial_Main(trialNo)
%Play 1 trial of the MannerPath experiment.
%Trial structure is sort of complex; it has 3 phases:
% Bias test - show M1P1 movie; take a forced choice response between M1P2
% and M2P1
% Training - Depending on the condition, show either MnP1 or M1Pn movies
% with foils
% Final test - take a forced choice response between M1P2 and M2P1 again

global RESOURCEFOLDER MAIN_ITEMS

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVIES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Trial movies
    movietoplay_ambigVid = strcat(RESOURCEFOLDER, '/movies/', MAIN_ITEMS.ambigV(trialNo));
    movietoplay_path = strcat(RESOURCEFOLDER, '/movies/', MAIN_ITEMS.pBiasV(trialNo));    
    movietoplay_manner = strcat(RESOURCEFOLDER, '/movies/', MAIN_ITEMS.mBiasV(trialNo));
    movietoplay_trainV1 = strcat(RESOURCEFOLDER, '/movies/', MAIN_ITEMS.trainV1(trialNo));
    movietoplay_Foil1 = strcat(RESOURCEFOLDER, '/movies/', MAIN_ITEMS.Foil1(trialNo));
    movietoplay_trainV2 = strcat(RESOURCEFOLDER, '/movies/', MAIN_ITEMS.trainV2(trialNo));
    movietoplay_Foil2 = strcat(RESOURCEFOLDER, '/movies/', MAIN_ITEMS.Foil2(trialNo));
    movietoplay_trainV3 = strcat(RESOURCEFOLDER, '/movies/', MAIN_ITEMS.trainV3(trialNo));
    movietoplay_Foil3 = strcat(RESOURCEFOLDER, '/movies/', MAIN_ITEMS.Foil3(trialNo));
    movietoplay_mTest = strcat(RESOURCEFOLDER, '/movies/', MAIN_ITEMS.mTestV(trialNo));
    movietoplay_pTest = strcat(RESOURCEFOLDER, '/movies/', MAIN_ITEMS.pTestV(trialNo));
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AUDIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %soundtoplay_ambigAudioFuture = strcat('Audio/Finished/', MAIN_ITEMS.ambigAudioFuture(trialNo));
    %soundtoplay_ambigAudioPast = strcat('Audio/Finished/', MAIN_ITEMS.ambigAudioPast(trialNo));
    %soundtoplay_trainAudioFuture1 = strcat('Audio/Finished/', MAIN_ITEMS.trainAudioFuture1(trialNo));
    %soundtoplay_trainAudioPast1 = strcat('Audio/Finished/', MAIN_ITEMS.trainAudioPast1(trialNo));
    %soundtoplay_trainAudioFuture2 = strcat('Audio/Finished/', MAIN_ITEMS.trainAudioFuture2(trialNo));
    %soundtoplay_trainAudioPast2 = strcat('Audio/Finished/', MAIN_ITEMS.trainAudioPast2(trialNo));
    %soundtoplay_trainAudioFuture3 = strcat('Audio/Finished/', MAIN_ITEMS.trainAudioFuture3(trialNo));
    %soundtoplay_trainAudioPast3 = strcat('Audio/Finished/', MAIN_ITEMS.trainAudioPast3(trialNo));
    soundtoplay_whichOne = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/', MAIN_ITEMS.AudioAnimal(trialNo));
    %soundtoplay_letsFind = strcat('Audio/Finished/aa_lets_find/', MAIN_ITEMS.letsFindAudio(trialNo));
    
    %Each animal's audio:
%     soundtoplay_elephant = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/elephant.wav', MAIN_ITEMS.elephant(trialNo));
%     soundtoplay_frog = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/frog.wav', MAIN_ITEMS.frog(trialNo));
%     soundtoplay_bird = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/bird.wav', MAIN_ITEMS.bird(trialNo));
%     soundtoplay_cat = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/cat.wav', MAIN_ITEMS.cat(trialNo));
%     soundtoplay_dog = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/dog.wav', MAIN_ITEMS.dog(trialNo));
%     soundtoplay_lion = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/lion.wav', MAIN_ITEMS.lion(trialNo));
%     soundtoplay_bee = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/bee.wav', MAIN_ITEMS.bee(trialNo));
%     soundtoplay_bear = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/bear.wav', MAIN_ITEMS.bear(trialNo));
%     soundtoplay_butterfly = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/butterfly.wav', MAIN_ITEMS.butterfly(trialNo));
%     soundtoplay_turtle = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/turtle.wav', MAIN_ITEMS.turtle(trialNo));
%     soundtoplay_duck = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/duck.wav', MAIN_ITEMS.duck(trialNo));
    
    %these ones are the same every time
    
    %soundtoplay_letsWatchMore = 'Audio/Finished/aa_motivation/letswatchmore.wav';
    soundtoplay_getReady = 'Audio/Finished/aa_motivation/getready.wav';
    %soundtoplay_goodJob = 'Audio/Finished/aa_motivation/goodjob.wav';
    %soundtoplay_nowLetsSee = 'Audio/Finished/aa_motivation/nowletssee.wav';
    %soundtoplay_wow = 'Audio/Finished/aa_motivation/wow.wav';
    soundtoplay_chimes = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/chimes.wav');
    soundtoplay_whoosh = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/whoosh.wav');
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ANIMAL IMAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

    %starImage = parameters.mainStars(trialNo);
    %greySquare = 'stars/grey.jpg';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLAY AMBIGUOUS VIDEO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Text_Show('READY? Press space.');
    Take_Response();
    Show_Blank;
    
    PlayCenterMovie(movietoplay_ambigVid{1});
    %PlayCenterMovie(movietoplay_ambigVid{1});
    %Show_Blank;
    WaitSecs(1.500);
    Play_Sound(soundtoplay_chimes, 'toBlock');

    WaitSecs(1.500);
    Show_Blank; 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % BIAS TEST
    % Play the two event movies; movie always plays L then R
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Play_Sound(soundtoplay_letsFind{1}, 'toBlock');
    Show_Blank;      
      
    %Using the human-interpretable side variables instead...
    if MAIN_ITEMS.BiasManner(trialNo) == 'L'
        PlaySideMovies(movietoplay_manner{1},'');
        PlaySideMovies('',movietoplay_path{1});
        
    elseif MAIN_ITEMS.BiasManner(trialNo) == 'R'
        PlaySideMovies(movietoplay_path{1},'');
        PlaySideMovies('',movietoplay_manner{1});
    end
        
    %And take a response
    Play_Sound(soundtoplay_whichOne{1}, 'toBlock');
    
    %****(Which animal gets...)****;
    Play_Sound(strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/lion.wav'), 'toBlock');
        Show_Blank;    
        
    MAIN_ITEMS.biasTestAns{trialNo} = Take_Response();
    Show_Blank();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3 TRAINING VIDEOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Play_Sound(soundtoplay_letsWatchMore, 'toBlock');
    %Text_Show('Ready to learn some verbs? Press space.');
    %Take_Response();
    %Show_Blank;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 111111111111111111111111111111111111111111111111111111111111111111111111
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    MAIN_ITEMS.trainStart(trialNo) = GetSecs;

    %Play_Sound(soundtoplay_trainAudioFuture1{1}, 'toBlock');

    PlayCenterMovie(movietoplay_trainV1{1}); 
    
    %PlayCenterMovie(movietoplay_trainV1{1});
    %Show_Blank;

    Play_Sound(soundtoplay_trainAudioPast1{1}, 'toBlock');
    %****(Which animal gets...)****;
    
    WaitSecs(1.500);
    
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 2222222222222222222222222222222222222222222222222222222222222222222222222
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Play_Sound(soundtoplay_trainAudioFuture2{1}, 'toBlock');
    
    PlayCenterMovie(movietoplay_trainV2{1});
    
    %PlayCenterMovie(movietoplay_trainV2{1});
    %Show_Blank;

    Play_Sound(soundtoplay_trainAudioPast2{1}, 'toBlock');
    %****(Which animal gets...)****;
    
    WaitSecs(1.500);
    
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 333333333333333333333333333333333333333333333333333333333333333333333333%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Play_Sound(soundtoplay_trainAudioFuture3{1}, 'toBlock');

    PlayCenterMovie(movietoplay_trainV3{1});
    
    %PlayCenterMovie(movietoplay_trainV3{1});
    %Show_Blank;

    Play_Sound(soundtoplay_trainAudioPast3{1}, 'toBlock');
    %****(Which animal gets...)****;
    
    MAIN_ITEMS.trainEnd(trialNo) = GetSecs;
   
    WaitSecs(1.500);
    Show_Blank;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% READY FOR THE TEST?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Text_Show('Ready for the test? Press space.');
    %Take_Response();
    %Show_Blank;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLAY THE TEST MOVIE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    MAIN_ITEMS.finalTestStart(trialNo) = GetSecs;

    %Play_Sound(soundtoplay_letsFind{1}, 'toBlock');
    %Show_Blank;      
  

    %Using the human-interpretable side variables...
    if MAIN_ITEMS.TestManner(trialNo) == 'L'
        PlaySideMovies(movietoplay_mTest{1},'');
        PlaySideMovies('',movietoplay_pTest{1});
    elseif MAIN_ITEMS.TestManner(trialNo) == 'R'
        PlaySideMovies(movietoplay_pTest{1},'');
        PlaySideMovies('',movietoplay_mTest{1});
    end
    
     %....and take a response
    Play_Sound(soundtoplay_whichOne{1}, 'toBlock');
    MAIN_ITEMS.finalTestAns{trialNo} = Take_Response();
    MAIN_ITEMS.finalTestEnd(trialNo) = GetSecs;
    
    %%%%%%%%%%%%%%%%%%%%%%
    % SHOW A NICE REWARD PICTURE
    %%%%%%%%%%%%%%%%%%%%%%
     

    
    imageArray=imread(char(starImage));
    rect = parameters.scr.rect;
    winPtr = parameters.scr.winPtr;   
    Screen('PutImage', winPtr , imageArray, rect );    
    Screen('flip',winPtr)
    resp1 = Take_Response(); %just moving on...
    Show_Blank;
    
    
    if resp1 == 'q'
            Closeout_PTool();
    end
    
    
    
    
end




