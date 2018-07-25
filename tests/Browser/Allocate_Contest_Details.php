<?php

namespace Tests\Browser;

use Tests\DuskTestCase;
use Laravel\Dusk\Browser;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class Allocate_Contest_Details extends DuskTestCase
{
    public function test_edit_admin_settings_successfully()
    {
        $this->browse(function ($browser) {

            $browser->visit('/contests/1/edit')
                ->clickLink('Create Event')
                ->pause(5000)
                ->assertPathIs('/events/create');
        });
    }
}
