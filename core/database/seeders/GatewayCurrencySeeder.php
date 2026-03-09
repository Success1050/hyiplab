<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class GatewayCurrencySeeder extends Seeder
{
    /**
     * Seed the gateway_currencies table so users can make deposits.
     *
     * This creates the gateway_currencies table if it doesn't exist,
     * then inserts a manual "Bank Transfer" gateway currency entry
     * so that the deposit form has at least one payment method available.
     */
    public function run(): void
    {
        // Create the gateway_currencies table if it doesn't exist
        if (!Schema::hasTable('gateway_currencies')) {
            Schema::create('gateway_currencies', function ($table) {
                $table->id();
                $table->string('name', 40)->nullable();
                $table->string('currency', 40)->nullable();
                $table->string('symbol', 40)->nullable();
                $table->integer('method_code')->default(0);
                $table->string('gateway_alias', 40)->nullable();
                $table->decimal('min_amount', 28, 8)->default(0);
                $table->decimal('max_amount', 28, 8)->default(0);
                $table->decimal('percent_charge', 5, 2)->default(0);
                $table->decimal('fixed_charge', 28, 8)->default(0);
                $table->decimal('rate', 28, 8)->default(0);
                $table->text('gateway_parameter')->nullable();
                $table->timestamps();
            });
        }

        // First, ensure there's a manual gateway (code >= 1000) in the gateways table
        $manualGateway = DB::table('gateways')->where('code', '>=', 1000)->first();

        if (!$manualGateway) {
            // Also make sure the forms table has an entry for the manual gateway
            $formId = DB::table('forms')->insertGetId([
                'act' => 'bank_transfer',
                'form_data' => json_encode([
                    'transaction_reference' => [
                        'name' => 'Transaction Reference',
                        'label' => 'Transaction Reference',
                        'is_required' => 'required',
                        'extensions' => null,
                        'options' => [],
                        'type' => 'text',
                    ],
                    'screenshot' => [
                        'name' => 'Payment Screenshot',
                        'label' => 'Payment Screenshot',
                        'is_required' => 'required',
                        'extensions' => 'jpg,jpeg,png',
                        'options' => [],
                        'type' => 'file',
                    ]
                ]),
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            // Insert the manual gateway
            DB::table('gateways')->insert([
                'form_id'              => $formId,
                'code'                 => 1000,
                'name'                 => 'Bank Transfer',
                'alias'                => 'bank_transfer',
                'image'                => null,
                'status'               => 1,
                'gateway_parameters'   => json_encode([
                    'bank_name' => [
                        'title' => 'Bank Name',
                        'global' => true,
                        'value' => 'First Bank / Access Bank',
                    ],
                    'account_number' => [
                        'title' => 'Account Number',
                        'global' => true,
                        'value' => '0123456789',
                    ],
                    'account_name' => [
                        'title' => 'Account Name',
                        'global' => true,
                        'value' => 'Investment Portal',
                    ],
                ]),
                'supported_currencies' => json_encode(['USD' => 'USD']),
                'crypto'               => 0,
                'extra'                => null,
                'description'          => 'Manual bank transfer deposit. Send payment to our bank account and upload proof.',
                'created_at'           => now(),
                'updated_at'           => now(),
            ]);

            $manualGateway = DB::table('gateways')->where('code', 1000)->first();
        }

        // Now insert gateway currency entries
        // Check if any gateway_currencies already exist
        $existingCount = DB::table('gateway_currencies')->count();

        if ($existingCount == 0) {
            // Add currency entry for the manual gateway (Bank Transfer)
            DB::table('gateway_currencies')->insert([
                'name'              => $manualGateway->name . ' USD',
                'currency'          => 'USD',
                'symbol'            => '$',
                'method_code'       => $manualGateway->code,
                'gateway_alias'     => $manualGateway->alias,
                'min_amount'        => 10.00000000,
                'max_amount'        => 100000.00000000,
                'percent_charge'    => 0.00,
                'fixed_charge'      => 0.00000000,
                'rate'              => 1.00000000,
                'gateway_parameter' => $manualGateway->gateway_parameters,
                'created_at'        => now(),
                'updated_at'        => now(),
            ]);

            $this->command->info('Gateway currency created: ' . $manualGateway->name . ' USD');
            $this->command->info('Users can now make deposits with amounts between $10 and $100,000');
        } else {
            $this->command->info('Gateway currencies already exist. Skipping...');
        }
    }
}
