import ddf.minim.*;
import ddf.minim.signals.*;

class Sound {

    Minim minim;
    AudioOutput aout;
    TriangleWave wave;

    Sound () {
        minim = new Minim(this);
        aout = minim.getLineOut(Minim.STEREO);
        wave = new TriangleWave(0, 0.02, aout.sampleRate());
        aout.addSignal(wave);
    }

    void play(int keyNum) {
        if(keyNum < 0) {
            wave.setFreq(0);
        } else {
            float freq = FREQ_BASE * pow(FREQ_RATE, keyNum);
            wave.setFreq(freq);
        }
    }
}
