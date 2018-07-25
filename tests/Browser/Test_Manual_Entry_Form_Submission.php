<?php

namespace Tests\Browser;

use Tests\DuskTestCase;
use Laravel\Dusk\Browser;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class Test_Manual_Entry_Form_Submission extends DuskTestCase
{

    public function test_manual_submission()
    {
        $this->browse(function (Browser $browser) {
            $browser->visit('/user_form')
                    ->assertChecked($agrees_to_terms)
                    ->press('Submit')
        });
    }
}
