
/*
 * MainScene.eq
 * Generated by Eqela Studio 2.0b7.4
 */

public class MainScene : SEScene
{

	int w;
	int h;
	int pix;
	int py;
	int wt;
	int ht;
	
	SESprite cloud;
	SESprite monster;
	SESprite rocket;
	SESprite superman;
	SESprite text;
	
	public void initialize(SEResourceCache rsc)
	{
		base.initialize(rsc);
		w = get_scene_width();
		h = get_scene_height();

		add_entity(SESpriteEntity.for_color(Color.instance("white"), w, h));
		
		rsc.prepare_image("mycloud", "cloud", w*0.5, h*0.5);
		rsc.prepare_image("mymonster", "monster", w*0.5, h*0.5);
		rsc.prepare_image("myrocket", "rocket", w*0.5, h*0.5);
		rsc.prepare_image("mysuperman", "superman", w*0.5, h*0.5);
		rsc.prepare_font("myfont", "arial bold color=black", 40);
		
		cloud = add_sprite_for_image(SEImage.for_resource("mycloud"));
		monster = add_sprite_for_image(SEImage.for_resource("mymonster"));
		rocket = add_sprite_for_image(SEImage.for_resource("myrocket"));
		superman = add_sprite_for_image(SEImage.for_resource("mysuperman"));

		rsc.prepare_image("myclouds", "cloud", w, h);
		rsc.prepare_image("mymonsters", "monster", w, h);
		rsc.prepare_image("myrockets", "rocket", w, h);
		rsc.prepare_image("mysupermans", "superman", w, h);

		
		cloud.move(0,0);
		monster.move(w*0.5,0);
		rocket.move(0, h*0.5);
		superman.move(0.5*w, 0.5*h);

		text = add_sprite_for_text(" ", "myfont");
		wt = text.get_width();
		ht = text.get_height();
	}


	public void on_pointer_press(SEPointerInfo pi)
	{
		base.on_pointer_press(pi);
		pix = pi.get_x();
		py = pi.get_y();

		if(pix > 0 && pix < w*0.5 && py > 0 && py < h*0.5)
		{
			text.set_text("CLOUD");
			text.move(w*0.25-0.5*wt, h*0.25-0.5*ht);
			cloud.set_alpha(0.5);
			monster.set_alpha(1);
			rocket.set_alpha(1);
			superman.set_alpha(1);
			if(pix > w*0.30 && pix < w*0.5 && py > 0 & py < h*0.15)
			{
				add_entity(SESpriteEntity.for_color(Color.instance("white"), w, h));
				cloud = add_sprite_for_image(SEImage.for_resource("myclouds"));
			}
			

		}
		else if(pix > 0.5*w && pix < w && py > 0 && py < 0.5*h)
		{
			text.set_text("MONSTER");
			text.move(w*0.75-0.5*wt, h*0.25-0.5*ht);
			cloud.set_alpha(1);
			monster.set_alpha(0.5);
			rocket.set_alpha(1);
			superman.set_alpha(1);
			if(pix > 0.5*w+0.25*w && pix < w && py > 0 && py < h*0.10)
			{
				monster =  add_sprite_for_image(SEImage.for_resource("mymonsters"));
			}
		}
		else if(pix > 0  && pix < w*0.5 && py > h*0.5 && py < h)
		{
			text.set_text("ROCKET");
			text.move(w*0.25-0.5*wt, h*0.75-0.25*ht);
			cloud.set_alpha(1);
			monster.set_alpha(1);
			rocket.set_alpha(0.5);
			superman.set_alpha(1);
			if(pix > w*0.30 && pix < w*0.5 && py > h*0.5 && py < h*0.5+h*0.10)
			{
				rocket =  add_sprite_for_image(SEImage.for_resource("myrockets"));
			}
			
		}
		else if(pix > 0.5*w && pix < w && py > 0 && py < 0.75*h)
		{
			text.set_text("SUPERMAN");
			text.move(w*0.75-0.25*wt, h*0.75-0.25*ht);
			cloud.set_alpha(1);
			monster.set_alpha(1);
			rocket.set_alpha(1);
			superman.set_alpha(0.5);
			if(pix > w*0.30+w*0.50 && pix < w && py > h*0.5 && py < h*0.5+h*0.10)
			{
				superman =  add_sprite_for_image(SEImage.for_resource("mysupermans"));
			}
		}
	}

	public void cleanup() {
		base.cleanup();
	}
}
