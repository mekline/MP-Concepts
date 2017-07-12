function [response] = MPP_Noun_Training()

global RESOURCEFOLDER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        % 8 BLOCKS OF TRAINING                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %Sounds that always play:
        soundtoplay_chimes = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/chimes.wav');
        soundtoplay_whoosh = strcat(RESOURCEFOLDER, 'audio/animalaudiofiles/whoosh.wav');
        
        soundtoplay_elephant = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/elephant.wav');
        soundtoplay_frog = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/frog.wav');
        soundtoplay_bird = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/bird.wav');
        soundtoplay_cat = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/cat.wav');
        soundtoplay_dog = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/dog.wav');
        soundtoplay_lion = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/lion.wav');
        soundtoplay_bee = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/bee.wav');
        soundtoplay_bear = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/bear.wav');
        soundtoplay_butterfly = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/butterfly.wav');
        soundtoplay_turtle = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/turtle.wav');
        soundtoplay_duck = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/duck.wav');

        %%%%%%%%%%%%%%%%%%%%%%
        %FIRST BLOCK     
        %%%%%%%%%%%%%%%%%%%%%%
        %Play_Sound(strcat(RESOURCEFOLDER, '/audio/aa_nouns/bone1.wav'), 'toBlock');
        %Show_Blank;
        
        Text_Show('READY? Press space.');
        Take_Response();
        Show_Blank;
        
        movietoplay_block1ambig = strcat(RESOURCEFOLDER, '/movies/crabwalk.into.garage.5.mov');
        movietoplay_block1bias_target = strcat(RESOURCEFOLDER, '/movies/crabwalk.down.birdhouse.5.mov');    
        movietoplay_block1bias_foil = strcat(RESOURCEFOLDER, '/movies/hop.into.cabin.5.mov');
        movietoplay_block1training1_target = strcat(RESOURCEFOLDER, '/movies/crabwalk.through.tunnel.5.mov');
        movietoplay_block1training1_foil = strcat(RESOURCEFOLDER, '/movies/stoopwalk.around.fountain.5.mov');
        movietoplay_block1training2_target = strcat(RESOURCEFOLDER, '/movies/crabwalk.over.tires.5.mov');
        movietoplay_block1training2_foil = strcat(RESOURCEFOLDER, '/movies/crawl.between.mailboxes.5.mov');
        movietoplay_block1training3_target = strcat(RESOURCEFOLDER, '/movies/crabwalk.front.bell.5.mov');
        movietoplay_block1training3_foil = strcat(RESOURCEFOLDER, '/movies/flapwalk.through.waterfall.5.mov');
        movietoplay_block1test_target = strcat(RESOURCEFOLDER, '/movies/crabwalk.up.cat.5.mov');
        movietoplay_block1test_foil = strcat(RESOURCEFOLDER, '/movies/roll.into.tower.5.mov');
        
        %AMBIGUOUS
        
        Show_Blank;

        PlayCenterMovie(movietoplay_block1ambig);
        WaitSecs(1.500);
        Play_Sound(soundtoplay_chimes, 'toBlock');

        Show_Blank;
    
        %BIAS
        
        PlaySideMovies(movietoplay_block1bias_foil,'');
        PlaySideMovies('',movietoplay_block1bias_target);
        Play_Sound(soundtoplay_cat, 'toBlock');
         
        parameters.block1BiasAns = Take_Response();
        Show_Blank;
        Take_Response(); %spacebar to go on
        Show_Blank;
        
        Play_Sound(soundtoplay_chimes, 'toBlock');
        
        
        
        
        
        PlaySideMovies(movietoplay_block1training1_foil,'');
        PlaySideMovies('',movietoplay_block1training1_target);
        Play_Sound(soundtoplay_cat, 'toBlock');
        Play_Sound(soundtoplay_chimes, 'toBlock');
        
        parameters.block1Training1Ans = Take_Response();
        Show_Blank;
        Take_Response(); %spacebar to go on
        Show_Blank;
        
        
        PlaySideMovies(movietoplay_block1training2_target,'');
        PlaySideMovies('',movietoplay_block1training2_foil);
        Play_Sound(soundtoplay_cat, 'toBlock');
        Play_Sound(soundtoplay_chimes, 'toBlock');
        
        parameters.block1Training2Ans = Take_Response();
        Show_Blank;
        Take_Response(); %spacebar to go on
        Show_Blank;
        
        
        PlaySideMovies(movietoplay_block1training3_foil,'');
        PlaySideMovies('',movietoplay_block1training3_target);
        Play_Sound(soundtoplay_cat, 'toBlock');
        Play_Sound(soundtoplay_chimes, 'toBlock');
        
        parameters.block1Training3Ans = Take_Response();
        Show_Blank;
        Take_Response(); %spacebar to go on
        Show_Blank;
        
        
        PlaySideMovies(movietoplay_block1test_target,'');
        PlaySideMovies('',movietoplay_block1test_foil);
        Play_Sound(soundtoplay_cat, 'toBlock');
        Play_Sound(soundtoplay_chimes, 'toBlock');
        
        parameters.block1TestAns = Take_Response();
        Show_Blank;
        Take_Response(); %spacebar to go on
        Show_Blank;
        
        Play_Sound(soundtoplay_whoosh, 'toBlock');
        
        %%%%%%%%%%%%%%%%%%%%%%
        %SECOND BLOCK     
        %%%%%%%%%%%%%%%%%%%%%%  
        
        Play_Sound(strcat(RESOURCEFOLDER, '/audio/aa_nouns/glorfin1.wav'), 'toBlock');
        Show_Blank;

        movietoplay_distractor = strcat(RESOURCEFOLDER, '/movies/1_noun_1_distractor.mov');
        movietoplay_target = strcat(RESOURCEFOLDER, '/movies/1_noun_1b.mov');    
        movietoplay_sign = strcat(RESOURCEFOLDER, '/movies/1_noun_1a.mov');

        PlayCenterMovie(movietoplay_sign);
        Show_Blank;
        
        Play_Sound((strcat(RESOURCEFOLDER, '/audio/aa_nouns/glorfin2.wav')), 'toBlock');
        Show_Blank;

        PlaySideMovies(movietoplay_target,'','caption_left','WOWOWOWOW');
        PlaySideMovies('',movietoplay_distractor,'caption_right','WOWOW'); 

        Play_Sound('/audio/aa_nouns/glorfin3.wav', 'toBlock');    
        
        parameters.noun2TestAns = Take_Response();
        
        Show_Blank;

        %Show_Image(strcat(RESOURCEFOLDER, '/', STARS.noun{3}));
        
        Take_Response(); %spacebar to go on
        
        Show_Blank;   

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    % END NOUN TRAINING                             
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    