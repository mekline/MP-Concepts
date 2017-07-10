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
    movietoplay_ambigVid = strcat('Movies/', mainItems.ambigV(trialNo));
    movietoplay_path = strcat('Movies/', mainItems.pBiasV(trialNo));    
    movietoplay_manner = strcat('Movies/', mainItems.mBiasV(trialNo));
    movietoplay_trainV1 = strcat('Movies/', mainItems.trainV1(trialNo));
    movietoplay_Foil1 = strcat('Movies/', mainItems.Foil1(trialNo));
    movietoplay_trainV2 = strcat('Movies/', mainItems.trainV2(trialNo));
    movietoplay_Foil2 = strcat('Movies/', mainItems.Foil2(trialNo));
    movietoplay_trainV3 = strcat('Movies/', mainItems.trainV3(trialNo));
    movietoplay_Foil3 = strcat('Movies/', mainItems.Foil3(trialNo));
    movietoplay_mTest = strcat('Movies/', mainItems.mTestV(trialNo));
    movietoplay_pTest = strcat('Movies/', mainItems.pTestV(trialNo));
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AUDIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %soundtoplay_ambigAudioFuture = strcat('Audio/Finished/', mainItems.ambigAudioFuture(trialNo));
    %soundtoplay_ambigAudioPast = strcat('Audio/Finished/', mainItems.ambigAudioPast(trialNo));
    %soundtoplay_trainAudioFuture1 = strcat('Audio/Finished/', mainItems.trainAudioFuture1(trialNo));
    %soundtoplay_trainAudioPast1 = strcat('Audio/Finished/', mainItems.trainAudioPast1(trialNo));
    %soundtoplay_trainAudioFuture2 = strcat('Audio/Finished/', mainItems.trainAudioFuture2(trialNo));
    %soundtoplay_trainAudioPast2 = strcat('Audio/Finished/', mainItems.trainAudioPast2(trialNo));
    %soundtoplay_trainAudioFuture3 = strcat('Audio/Finished/', mainItems.trainAudioFuture3(trialNo));
    %soundtoplay_trainAudioPast3 = strcat('Audio/Finished/', mainItems.trainAudioPast3(trialNo));
    soundtoplay_whichOne = strcat('audio/animalaudiofiles/', mainItems.AnimalAudio(trialNo));
    %soundtoplay_letsFind = strcat('Audio/Finished/aa_lets_find/', mainItems.letsFindAudio(trialNo));
    
    %Each animal's audio:
    soundtoplay_elephant = strcat('audio/animalaudiofiles/elephant.wav', mainItems.elephant(trialNo));
    soundtoplay_frog = strcat('audio/animalaudiofiles/frog.wav', mainItems.frog(trialNo));
    soundtoplay_bird = strcat('audio/animalaudiofiles/bird.wav', mainItems.bird(trialNo));
    soundtoplay_cat = strcat('audio/animalaudiofiles/cat.wav', mainItems.cat(trialNo));
    soundtoplay_dog = strcat('audio/animalaudiofiles/dog.wav', mainItems.dog(trialNo));
    soundtoplay_lion = strcat('audio/animalaudiofiles/lion.wav', mainItems.lion(trialNo));
    soundtoplay_bee = strcat('audio/animalaudiofiles/bee.wav', mainItems.bee(trialNo));
    soundtoplay_bear = strcat('audio/animalaudiofiles/bear.wav', mainItems.bear(trialNo));
    soundtoplay_butterfly = strcat('audio/animalaudiofiles/butterfly.wav', mainItems.butterfly(trialNo));
    soundtoplay_turtle = strcat('audio/animalaudiofiles/turtle.wav', mainItems.turtle(trialNo));
    soundtoplay_duck = strcat('audio/animalaudiofiles/duck.wav', mainItems.duck(trialNo));
    
    %these ones are the same every time
    
    %soundtoplay_letsWatchMore = 'Audio/Finished/aa_motivation/letswatchmore.wav';
    soundtoplay_getReady = 'Audio/Finished/aa_motivation/getready.wav';
    %soundtoplay_goodJob = 'Audio/Finished/aa_motivation/goodjob.wav';
    %soundtoplay_nowLetsSee = 'Audio/Finished/aa_motivation/nowletssee.wav';
    %soundtoplay_wow = 'Audio/Finished/aa_motivation/wow.wav';
    Chime sound; 
    Whoosh transition;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ANIMAL IMAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

    %starImage = parameters.mainStars(trialNo);
    %greySquare = 'stars/grey.jpg';
    
    elephant = 'elephant.jpg';
    frog = 'frog.jpg';
    bird = 'bird.jpg';
    cat = 'cat.jpg';
    dog = 'dog.jpg';
    lion = 'lion.jpg';
    bee = 'bee.jpg';
    bear = 'bear.jpg';
    butterfly = 'butterfly.jpg';
    turtle = 'turtle.jpg';
    duck = 'duck.jpg';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLAY AMBIGUOUS VIDEO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Text_Show('READY? Press space.');
    Take_Response();
    Show_Blank;

    %Play_Sound(soundtoplay_ambigAudioFuture{1}, 'toBlock');
    
    PlayCenterMovie(movietoplay_ambigVid{1});
    %PlayCenterMovie(movietoplay_ambigVid{1});
    %Show_Blank;
        
    Play_Sound(soundtoplay_ambigAudioPast{1}, 'toBlock');
        
    Show_Blank; 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % BIAS TEST
    % Play the two event movies; movie always plays L then R
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Play_Sound(soundtoplay_letsFind{1}, 'toBlock');
    Show_Blank;      
      
    %Using the human-interpretable side variables instead...
    if mainItems.BiasManner(trialNo) == 'L'
        PlaySideMovies(movietoplay_manner{1},'');
        PlaySideMovies('',movietoplay_path{1});
        
    elseif mainItems.BiasManner(trialNo) == 'R'
        PlaySideMovies(movietoplay_path{1},'');
        PlaySideMovies('',movietoplay_manner{1});
    end
        
    %And take a response
    Play_Sound(soundtoplay_whichOne{1}, 'toBlock');
    
    %****(Which animal gets...)****;
    Play_Sound(strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/lion.wav'), 'toBlock');
        Show_Blank;    
        
    mainItems.biasTestAns{trialNo} = Take_Response();
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

    mainItems.trainStart(trialNo) = GetSecs;

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
    
    mainItems.trainEnd(trialNo) = GetSecs;
   
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

    mainItems.finalTestStart(trialNo) = GetSecs;

    %Play_Sound(soundtoplay_letsFind{1}, 'toBlock');
    %Show_Blank;      
  

    %Using the human-interpretable side variables...
    if mainItems.TestManner(trialNo) == 'L'
        PlaySideMovies(movietoplay_mTest{1},'');
        PlaySideMovies('',movietoplay_pTest{1});
    elseif mainItems.TestManner(trialNo) == 'R'
        PlaySideMovies(movietoplay_pTest{1},'');
        PlaySideMovies('',movietoplay_mTest{1});
    end
    
     %....and take a response
    Play_Sound(soundtoplay_whichOne{1}, 'toBlock');
    mainItems.finalTestAns{trialNo} = Take_Response();
    mainItems.finalTestEnd(trialNo) = GetSecs;
    
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




