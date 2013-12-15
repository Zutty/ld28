/**
 * Created with IntelliJ IDEA.
 * User: Zutty
 * Date: 15/12/2013
 * Time: 14:19
 * To change this template use File | Settings | File Templates.
 */
package uk.co.zutty.ld28 {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Spritemap;

    public class CombatHud extends Entity {

        [Embed(source="/gun_icon.png")]
        private static const GUN_ICON_IMAGE:Class;
        [Embed(source="/numbers.png")]
        private static const NUMBERS_IMAGE:Class;
        [Embed(source="/health_icon.png")]
        private static const HEALTH_ICON_IMAGE:Class;

        private var _ammoSpritemap:Spritemap;
        private var _healthSpritemap:Vector.<Spritemap>;

        public function CombatHud() {
            var gunIcon:Image = new Image(GUN_ICON_IMAGE);
            gunIcon.scrollX = 0;
            gunIcon.x = 2;
            gunIcon.y = 2;
            addGraphic(gunIcon);

            _ammoSpritemap = new Spritemap(NUMBERS_IMAGE, 3, 4);
            _ammoSpritemap.add("1", [0]);
            _ammoSpritemap.add("2", [1]);
            _ammoSpritemap.add("3", [2]);
            _ammoSpritemap.add("4", [3]);
            _ammoSpritemap.add("5", [4]);
            _ammoSpritemap.add("6", [5]);
            _ammoSpritemap.add("7", [6]);
            _ammoSpritemap.add("8", [7]);
            _ammoSpritemap.add("9", [8]);
            _ammoSpritemap.add("0", [9]);
            _ammoSpritemap.scrollX = 0;
            _ammoSpritemap.x = 12;
            _ammoSpritemap.y = 11;
            addGraphic(_ammoSpritemap);

            _healthSpritemap = new Vector.<Spritemap>(Player.MAX_HEALTH);
            for(var i:int = 0; i < Player.MAX_HEALTH; i++) {
                _healthSpritemap[i] = new Spritemap(HEALTH_ICON_IMAGE, 12, 7);
                _healthSpritemap[i].add("on", [0]);
                _healthSpritemap[i].add("off", [1]);
                _healthSpritemap[i].scrollX = 0;
                _healthSpritemap[i].x = 19 + i * 12;
                _healthSpritemap[i].y = 3;
                addGraphic(_healthSpritemap[i]);
            }
        }

        public function set ammo(value:int):void {
            if(value >= 0 && value <= 9) {
                _ammoSpritemap.play(value.toString());
            }
        }

        public function set health(value:int):void {
            for(var i:int = 0; i < Player.MAX_HEALTH; i++) {
                _healthSpritemap[i].play(i < value ? "on" : "off");
            }
        }
    }
}
