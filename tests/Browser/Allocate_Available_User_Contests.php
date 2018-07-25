<?php

namespace Tests\Browser;

use Tests\DuskTestCase;
use Laravel\Dusk\Browser;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class Allocate_Available_User_Contests extends DuskTestCase
{
    /**
     * A Dusk test example.
     *
     * @return void
     */
    public function test_I_can_create_contest_successfully()
    {
        $this->browse(function ($browser) {

            $browser->visit('/contests/create')
                ->type('title', 'My Contest')
                ->press('Add Contest')
                ->pause(5000)
                ->assertPathIs('/contests');
        });
    }
}