<?php

namespace Tests\Browser;

use Tests\DuskTestCase;
use Laravel\Dusk\Browser;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class Allocate_Contest_Admin_Settings extends DuskTestCase
{
    public function test_edit_admin_settings_successfully()
{
    $this->browse(function ($browser) {

        $browser->visit('/contests/1/edit')
            ->type('title', 'My Contest New Name')
            ->press('Update Contest')
            ->pause(5000)
            ->assertPathIs('/contests/1');
    });
}
}
