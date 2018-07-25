<?php

namespace Tests\Browser;

use Tests\DuskTestCase;
use Laravel\Dusk\Browser;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class Test_Mobile_View_Login_Page extends DuskTestCase
{

    public function test_mobile_login()
    {
        $this->browse(function (Browser $browser) {
            $browser->visit('/login')
                    ->resize(800, 600);
                    ->assertSee('Login');
        });
    }
}
