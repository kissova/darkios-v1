- (void)drawInMTKView:(MTKView *)view {
    // ... (diğer kodlar)
    
    if (self.moduleControl->menuStatus) {
        // Menüyü çiz
        if ([self.mi respondsToSelector:@selector(drawMenuWindow)]) {
            [self.mi performSelector:@selector(drawMenuWindow)];
        }
    }
    
    // ... (diğer kodlar)
}
