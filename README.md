cocos2d-x_linux_qt_template
===========================

Here are some extern cpp templates with Qt project for developer who working on linux use cocos2d-x

And Now master repo fit the release version2.2.x 

### How to use it
0) all from zero. you need run the file 'make-all-linux-project.sh' which locate at the rood dir of cocos2d-x to make 
   some libraries,libcocos2d.so and so on.
   
1) patch all files to the root dir of cocos2d-x.

2) use 'create_project.py' create a project as usual, then you will find a dir named 'proj.qt' on your project dir with      her buddies proj.xxx

3) open your QtCreator and open the file  'YOUR_PROJECT_NAME.pro', and at the config dialog chose one between debug and
   release version(only one of them).Then modify the path to 'proj.qt'
   etc:
        I borned a project name 'HelloGirl'
        
        >>>before modified my dialog was:
        <*> Desktop
        [*] Debug:       /home/king/cocos2d-x/cocos2d-x-2.2/projects/HelloGirl/build-HelloGirl-desktop-Debug
        [ ] Release:     /home/king/cocos2d-x/cocos2d-x-2.2/projects/HelloGirl/build-HelloGirl-desktop-release
        
        >>>after modified my dialog became:
        <*> Desktop
        [*] Debug:       /home/king/cocos2d-x/cocos2d-x-2.2/projects/HelloGirl/proj.qt  (<-----modified here)
        [ ] Release:     /home/king/cocos2d-x/cocos2d-x-2.2/projects/HelloGirl/build-HelloGirl-desktop-release

4) every thing is ok, now push the 'Run' button and a happy day coming ;) !

### Note this template only worked on *nix platform 
