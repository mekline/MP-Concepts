function [response] = MPP_Noun_Training()

global RESOURCEFOLDER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        % 8 BLOCKS OF TRAINING                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %Sounds that always play:
        soundtoplay_chimes = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/chimes.wav');
        soundtoplay_whoosh = strcat(RESOURCEFOLDER, '/audio/animalaudiofiles/whoosh.wav');
        
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

        WaitSecs(1.500);
        Show_Blank;
    
        %BIAS
        
        PlaySideMovies(movietoplay_block1bias_foil,'');
        PlaySideMovies('',movietoplay_block1bias_target);
        Play_Sound(soundtoplay_cat, 'toBlock');
         
        parameters.block1BiasAns = Take_Response();
        Take_Response(); %spacebar to go on
        WaitSecs(1.000)
        Play_Sound(soundtoplay_chimes, 'toBlock');
        WaitSecs(1.500)
        Show_Blank;
        
        %TRAINING
        
        PlaySideMovies(movietoplay_block1training1_foil,'');
        PlaySideMovies('',movietoplay_block1training1_target);
        Play_Sound(soundtoplay_cat, 'toBlock');
        
        parameters.block1Training1Ans = Take_Response();
        Take_Response(); %spacebar to go on
        WaitSecs(1.000)
        Play_Sound(soundtoplay_chimes, 'toBlock');
        WaitSecs(1.500)
        Show_Blank;
        
        
        PlaySideMovies(movietoplay_block1training2_target,'');
        PlaySideMovies('',movietoplay_block1training2_foil);
        Play_Sound(soundtoplay_cat, 'toBlock');
        
        parameters.block1Training2Ans = Take_Response();
        Take_Response(); %spacebar to go on
        WaitSecs(1.000)
        Play_Sound(soundtoplay_chimes, 'toBlock');
        WaitSecs(1.500)
        Show_Blank;
        
        
        PlaySideMovies(movietoplay_block1training3_foil,'');
        PlaySideMovies('',movietoplay_block1training3_target);
        Play_Sound(soundtoplay_cat, 'toBlock');
        
        parameters.block1Training3Ans = Take_Response();
        Take_Response(); %spacebar to go on
        WaitSecs(1.000)
        Play_Sound(soundtoplay_chimes, 'toBlock');
        WaitSecs(1.500)
        Show_Blank;
        
        %TEST
        
        PlaySideMovies(movietoplay_block1test_target,'');
        PlaySideMovies('',movietoplay_block1test_foil);
        Play_Sound(soundtoplay_cat, 'toBlock');
        
        parameters.block1TestAns = Take_Response();
        Take_Response(); %spacebar to go on
        WaitSecs(1.000)
        Play_Sound(soundtoplay_chimes, 'toBlock');
        WaitSecs(1.500)
        Show_Blank;
        
        WaitSecs(1.000)
        Play_Sound(soundtoplay_whoosh, 'toBlock');
        
        %%%%%%%%%%%%%%%%%%%%%%
        %SECOND BLOCK     
        %%%%%%%%%%%%%%%%%%%%%%  
        
        Text_Show('READY? Press space.');
        Take_Response();
        Show_Blank;
        
        movietoplay_block2ambig = strcat(RESOURCEFOLDER, '/movies/stoopwalk.through.flowers.5.mov');
        movietoplay_block2bias_target = strcat(RESOURCEFOLDER, '/movies/stoopwalk.between.swings.5.mov');    
        movietoplay_block2bias_foil = strcat(RESOURCEFOLDER, '/movies/tiptoe.through.lighthouse.5.mov');
        movietoplay_block2training1_target = strcat(RESOURCEFOLDER, '/movies/stoopwalk.into.barn.5.mov');
        movietoplay_block2training1_foil = strcat(RESOURCEFOLDER, '/movies/walk.down.cow.5.mov');
        movietoplay_block2training2_target = strcat(RESOURCEFOLDER, '/movies/stoopwalk.around.fountain.5.mov');
        movietoplay_block2training2_foil = strcat(RESOURCEFOLDER, '/movies/hop.over.book.5.mov');
        movietoplay_block2training3_target = strcat(RESOURCEFOLDER, '/movies/stoopwalk.up.monkey.5.mov');
        movietoplay_block2training3_foil = strcat(RESOURCEFOLDER, '/movies/roll.down.eagle.5.mov');
        movietoplay_block2test_target = strcat(RESOURCEFOLDER, '/movies/stoopwalk.front.fishtank.5.mov');
        movietoplay_block2test_foil = strcat(RESOURCEFOLDER, '/movies/crawl.through.pyramid.5.mov');
        
        %AMBIGUOUS
        
        Show_Blank;

        PlayCenterMovie(movietoplay_block2ambig);
        WaitSecs(1.500);
        Play_Sound(soundtoplay_chimes, 'toBlock');

        WaitSecs(1.500);
        Show_Blank;
    
        %BIAS
        
        PlaySideMovies(movietoplay_block2bias_target,'');
        PlaySideMovies('',movietoplay_block2bias_foil);
        Play_Sound(soundtoplay_bear, 'toBlock');
         
        parameters.block2BiasAns = Take_Response();
        Take_Response(); %spacebar to go on
        WaitSecs(1.000)
        Play_Sound(soundtoplay_chimes, 'toBlock');
        WaitSecs(1.500)
        Show_Blank;
        
        %TRAINING
        
        PlaySideMovies(movietoplay_block2training1_foil,'');
        PlaySideMovies('',movietoplay_block2training1_target);
        Play_Sound(soundtoplay_bear, 'toBlock');
        
        parameters.block2Training1Ans = Take_Response();
        Take_Response(); %spacebar to go on
        WaitSecs(1.000)
        Play_Sound(soundtoplay_chimes, 'toBlock');
        WaitSecs(1.500)
        Show_Blank;
        
        
        PlaySideMovies(movietoplay_block2training2_target,'');
        PlaySideMovies('',movietoplay_block2training2_foil);
        Play_Sound(soundtoplay_bear, 'toBlock');
        
        parameters.block2Training2Ans = Take_Response();
        Take_Response(); %spacebar to go on
        WaitSecs(1.000)
        Play_Sound(soundtoplay_chimes, 'toBlock');
        WaitSecs(1.500)
        Show_Blank;
        
        
        PlaySideMovies(movietoplay_block2training3_target,'');
        PlaySideMovies('',movietoplay_block2training3_foil);
        Play_Sound(soundtoplay_bear, 'toBlock');
        
        parameters.block2Training3Ans = Take_Response();
        Take_Response(); %spacebar to go on
        WaitSecs(1.000)
        Play_Sound(soundtoplay_chimes, 'toBlock');
        WaitSecs(1.500)
        Show_Blank;
        
        %TEST
        
        PlaySideMovies(movietoplay_block2test_foil,'');
        PlaySideMovies('',movietoplay_block2test_target);
        Play_Sound(soundtoplay_bear, 'toBlock');
        
        parameters.block2TestAns = Take_Response();
        Take_Response(); %spacebar to go on
        WaitSecs(1.000)
        Play_Sound(soundtoplay_chimes, 'toBlock');
        WaitSecs(1.500)
        Show_Blank;
        
        WaitSecs(1.000)
        Play_Sound(soundtoplay_whoosh, 'toBlock');   

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    %END MAIN TRAINING BLOCKS                             
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    