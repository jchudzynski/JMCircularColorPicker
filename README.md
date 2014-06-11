CircularColorPicker
===================
Description:
Animated circular color picker
You can use this simple picker to add a color picker to your project.

Installation
1. Copy the CircularColorPicker.h and .m to your project
2. Make sure that you have defined macros for calculating degreesToRadians. In the demo I included it in the .pch file.

   #define degreesToRadians( degrees ) ( ( degrees ) / 180.0 * M_PI )

3. Import the header of CircularColorPicker to your project

4. Initialize picker and add it to the view

 CircularPicker * cp = [[CircularPicker alloc] initWithFrame:self.view.bounds andCompletionHandler:^(UIColor * color){
       //use the color however you woould like
       NSLog(@"Color is %@",color);
    }];
    
   //add to the view
    [self.view addSubview:cp];

Have fun!
