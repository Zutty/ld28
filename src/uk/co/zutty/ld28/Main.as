package uk.co.zutty.ld28 {
    import net.flashpunk.Engine;
    import net.flashpunk.FP;

    [SWF(width="640", height="360", frameRate="60", backgroundColor="000000")]
    public class Main extends Engine {
        public function Main() {
            super(128, 72, 60, true);

            FP.screen.scale = 5;
            FP.screen.color = 0x6699E6;

            FP.world = new GameWorld();
        }
    }
}
