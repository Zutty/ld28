package uk.co.zutty.ld28 {
    import net.flashpunk.Engine;
    import net.flashpunk.FP;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;

    [SWF(width="640", height="360", frameRate="60", backgroundColor="000000")]
    public class Main extends Engine {
        public function Main() {
            super(128, 72, 60, true);

            FP.screen.scale = 5;
            FP.screen.color = 0x6699E6;

            Input.define("move", Key.D, Key.RIGHT);
            Input.define("action", Key.ENTER, Key.SPACE, Key.A);

            FP.world = new TitleWorld();
        }
    }
}
