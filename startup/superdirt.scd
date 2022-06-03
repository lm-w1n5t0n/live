(
s.reboot {
    s.options.numBuffers = 1024 * 256; // increase this if you need to load more samples
    s.options.memSize = 8192 * 32; // increase this if you get "alloc failed" messages
    s.options.numWireBufs = 64*2; // increase this if you get "exceeded number of interconnect buffers" messages
    s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"
    s.options.numOutputBusChannels = 2; // set this to your hardware output channel size, if necessary
    s.options.numInputBusChannels = 2; // set this to your hardware output channel size, if necessary

    s.waitForBoot {
        ~dirt.stop;
        ~dirt = SuperDirt(2, s); // two output channels
        // load samples from multiple folders:
        ~dirt.loadSoundFiles();
        ~dirt.loadSoundFiles("~/samples/tidal/*");
        s.sync; // wait for supercollider to finish booting up
        ~dirt.start(57120, [0, 0]); // start superdirt, listening on port 57120, create two orbits each sending audio to channel 0
    };

};
);

s.meter

s.quit