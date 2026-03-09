@extends('Template::layouts.master')
@section('content')
<div class="contract-page">
    {{-- Header --}}
    <div class="c-header">
        <a href="{{ route('user.asset.details', $type) }}" class="c-header__back">
            <i class="las la-arrow-left"></i>
        </a>
    </div>

    {{-- Page Title --}}
    <div class="c-page-title">
        <h2 class="c-page-title__heading">@lang('Request Investment Contract')</h2>
        <p class="c-page-title__sub">@lang('Please complete the form below to request an investment contract.')</p>
    </div>

    {{-- Contract Info Card --}}
    <div class="c-info-card">
        <div class="c-info-card__header">
            <h5 class="c-info-card__title">{{ $contract['name'] }} @lang('Investment Contract')</h5>
            <span class="c-info-card__step">@lang('Step 1 of 1') &middot; @lang('Application Form')</span>
        </div>
        <div class="c-info-card__body">
            <div class="c-info-card__row">
                <span class="c-info-card__label">{{ $contract['price_label'] }}:</span>
                <span class="c-info-card__value">${{ number_format($contract['price_per_unit']) }}</span>
            </div>
            <div class="c-info-card__row">
                <span class="c-info-card__label">@lang('Minimum') {{ $contract['unit_label'] }}:</span>
                <span class="c-info-card__value">{{ number_format($contract['min_units']) }}</span>
            </div>
            <div class="c-info-card__row">
                <span class="c-info-card__label">@lang('Minimum Capital'):</span>
                <span class="c-info-card__value">${{ number_format($contract['min_capital']) }}</span>
            </div>
            <div class="c-info-card__row">
                <span class="c-info-card__label">@lang('Estimated Term'):</span>
                <span class="c-info-card__value">{{ $contract['estimated_term'] }}</span>
            </div>
            <div class="c-info-card__row">
                <span class="c-info-card__label">@lang('Projected Return'):</span>
                <span class="c-info-card__value">{{ $contract['projected_return'] }} @lang('percent')</span>
            </div>
        </div>
    </div>

    {{-- Estimated Return Range --}}
    <div class="c-return-box">
        <div class="c-return-box__icon"><i class="las la-lock"></i></div>
        <div class="c-return-box__content">
            <span class="c-return-box__label">@lang('Estimated Return Range for your target'):</span>
            <span class="c-return-box__range" id="returnRange">
                {{ $contract['return_min_pct'] }}% @lang('of') ${{ number_format($contract['min_capital']) }} = ${{ number_format($contract['min_capital'] * $contract['return_min_pct'] / 100) }}
                &nbsp;&ndash;&nbsp;
                {{ $contract['return_max_pct'] }}% @lang('of') ${{ number_format($contract['min_capital']) }} = ${{ number_format($contract['min_capital'] * $contract['return_max_pct'] / 100) }}
            </span>
        </div>
    </div>

    {{-- Contract Form --}}
    <form class="c-form" id="contractForm" method="POST" action="javascript:void(0)" enctype="multipart/form-data">
        @csrf

        {{-- Number of Units + Total Investment --}}
        <div class="c-form__row c-form__row--split">
            <div class="c-form__group c-form__group--grow">
                <label class="c-form__label">@lang('Number of') {{ $contract['unit_label'] }}</label>
                <input type="number" class="c-form__input" id="unitCount" name="units"
                       value="{{ $contract['min_units'] }}" min="{{ $contract['min_units'] }}" required>
            </div>
            <div class="c-form__group c-form__group--total">
                <label class="c-form__label">@lang('Total Investment')</label>
                <div class="c-form__total" id="totalInvestment">
                    ${{ number_format($contract['min_units'] * $contract['price_per_unit']) }}
                    <i class="las la-calculator"></i>
                </div>
            </div>
        </div>

        {{-- Contract Duration --}}
        <div class="c-form__group">
            <label class="c-form__label">@lang('Contract Duration')</label>
            <select class="c-form__select" name="duration" required>
                @foreach($contract['durations'] as $dur)
                    <option value="{{ $dur }}">{{ $dur }}</option>
                @endforeach
            </select>
        </div>

        {{-- Security Notice --}}
        <div class="c-security-notice">
            <i class="las la-lock"></i>
            <div>
                <span class="c-security-notice__text">@lang('Your information is encrypted and securely stored.')</span>
                <span class="c-security-notice__sub">@lang('Wahed Group Compliance Team will review your request within 24 hours.')</span>
            </div>
        </div>

        {{-- Investor Information --}}
        <h5 class="c-form__section-title">
            <i class="las la-user-circle"></i>
            @lang('Investor Information')
        </h5>

        <div class="c-form__row c-form__row--split">
            <div class="c-form__group c-form__group--grow">
                <label class="c-form__label"><i class="las la-user"></i> @lang('Full Name')</label>
                <input type="text" class="c-form__input" name="full_name"
                       value="{{ $user->fullname }}" placeholder="John Doe" required>
            </div>
            <div class="c-form__group c-form__group--grow">
                <label class="c-form__label"><i class="las la-phone"></i> @lang('Phone Number')</label>
                <input type="text" class="c-form__input" name="phone"
                       value="{{ $user->mobile }}" placeholder="(123) 456-7890" required>
            </div>
        </div>

        <div class="c-form__group">
            <label class="c-form__label"><i class="las la-home"></i> @lang('Residential Address')</label>
            <input type="text" class="c-form__input" name="address"
                   placeholder="123 Main Street | EX4, City, State, ZIP" required>
        </div>

        <div class="c-form__group">
            <label class="c-form__label">@lang('Upload ID Document')</label>
            <input type="file" class="c-form__file" name="id_document" accept=".pdf,.jpg,.jpeg,.png">
        </div>

        {{-- Investment Details --}}
        <h5 class="c-form__section-title">
            <i class="las la-coins"></i>
            @lang('Investment Details')
        </h5>

        <div class="c-form__group">
            <label class="c-form__label">@lang('Planned Investment Amount') <strong id="plannedAmountLabel">${{ number_format($contract['min_units'] * $contract['price_per_unit']) }}</strong></label>
            <select class="c-form__select" name="source" required>
                <option value="">@lang('Select Source')</option>
                <option value="deposit_wallet">@lang('Deposit Wallet')</option>
                <option value="interest_wallet">@lang('Interest Wallet')</option>
                <option value="bank_transfer">@lang('Bank Transfer')</option>
                <option value="crypto">@lang('Cryptocurrency')</option>
            </select>
        </div>

        {{-- Risk Acknowledgment --}}
        <h5 class="c-form__section-title">
            <i class="las la-exclamation-triangle"></i>
            @lang('Risk Acknowledgment')
        </h5>

        <div class="c-form__check">
            <input type="checkbox" id="riskCheck" name="risk_acknowledged" required>
            <label for="riskCheck">{{ $contract['risk_text'] }}</label>
        </div>

        <div class="c-form__check">
            <input type="checkbox" id="termsCheck" name="terms_accepted" required>
            <label for="termsCheck">@lang('I have read and agree to the investment contract terms and conditions.')</label>
        </div>

        {{-- Submit --}}
        <button type="submit" class="c-form__submit">
            <i class="las la-file-signature"></i>
            @lang('Submit Contract Request')
        </button>
    </form>
</div>

@push('style')
<style>
/* ============================================
   Investment Contract Form — Premium Style
   ============================================ */
.contract-page {
    font-family: 'Inter', 'Maven Pro', sans-serif;
    max-width: 720px;
    margin: 0 auto;
    padding: 20px 0 60px;
}

/* Header */
.c-header {
    margin-bottom: 24px;
}
.c-header__back {
    width: 42px;
    height: 42px;
    border-radius: 50%;
    background: #fff;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: #1a202c;
    font-size: 20px;
    text-decoration: none !important;
    box-shadow: 0 2px 10px rgba(0,0,0,0.06);
    transition: all 0.2s;
}
.c-header__back:hover {
    background: #f8fafc;
    transform: translateX(-2px);
    color: #1a202c;
}

/* Page Title */
.c-page-title {
    text-align: center;
    margin-bottom: 32px;
}
.c-page-title__heading {
    font-size: 26px;
    font-weight: 800;
    color: #1a1f36;
    margin: 0 0 6px;
    letter-spacing: -0.5px;
}
.c-page-title__sub {
    font-size: 14px;
    color: #8b95a2;
    margin: 0;
    font-weight: 400;
}

/* Contract Info Card */
.c-info-card {
    background: #fff;
    border: 1px solid #eef0f4;
    border-radius: 16px;
    overflow: hidden;
    margin-bottom: 20px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.03);
}
.c-info-card__header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 18px 22px;
    border-bottom: 1px solid #f0f2f5;
    flex-wrap: wrap;
    gap: 8px;
}
.c-info-card__title {
    font-size: 16px;
    font-weight: 700;
    color: #1a1f36;
    margin: 0;
}
.c-info-card__step {
    font-size: 12px;
    color: #8b95a2;
    font-weight: 500;
}
.c-info-card__body {
    padding: 18px 22px;
}
.c-info-card__row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 6px 0;
}
.c-info-card__label {
    font-size: 13.5px;
    color: #4a5568;
    font-weight: 500;
}
.c-info-card__value {
    font-size: 13.5px;
    font-weight: 700;
    color: #1a1f36;
}

/* Return Range Box */
.c-return-box {
    display: flex;
    align-items: flex-start;
    gap: 12px;
    background: #f8fafc;
    border: 1px solid #eef0f4;
    border-radius: 14px;
    padding: 16px 20px;
    margin-bottom: 30px;
}
.c-return-box__icon {
    width: 32px;
    height: 32px;
    flex-shrink: 0;
    background: #eef4ff;
    color: #4c7de6;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 16px;
}
.c-return-box__label {
    display: block;
    font-size: 12px;
    color: #8b95a2;
    font-style: italic;
    margin-bottom: 4px;
}
.c-return-box__range {
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: #1a1f36;
    line-height: 1.5;
}

/* Form */
.c-form {
    margin-top: 10px;
}
.c-form__row--split {
    display: flex;
    gap: 14px;
}
.c-form__group {
    margin-bottom: 20px;
}
.c-form__group--grow {
    flex: 1;
    margin-bottom: 20px;
}
.c-form__group--total {
    min-width: 180px;
    margin-bottom: 20px;
}
.c-form__label {
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: #4a5568;
    margin-bottom: 6px;
}
.c-form__label i {
    margin-right: 4px;
    color: #8b95a2;
}
.c-form__input {
    width: 100%;
    padding: 11px 14px;
    border: 1.5px solid #e2e5ea;
    border-radius: 10px;
    font-size: 14px;
    color: #1a1f36;
    background: #fff;
    font-family: inherit;
    transition: border-color 0.2s, box-shadow 0.2s;
    outline: none;
}
.c-form__input:focus {
    border-color: #4c7de6;
    box-shadow: 0 0 0 3px rgba(76,125,230,0.1);
}
.c-form__select {
    width: 100%;
    padding: 11px 14px;
    border: 1.5px solid #e2e5ea;
    border-radius: 10px;
    font-size: 14px;
    color: #1a1f36;
    background: #fff;
    font-family: inherit;
    appearance: none;
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 12px center;
    background-size: 14px;
    cursor: pointer;
    outline: none;
    transition: border-color 0.2s, box-shadow 0.2s;
}
.c-form__select:focus {
    border-color: #4c7de6;
    box-shadow: 0 0 0 3px rgba(76,125,230,0.1);
}
.c-form__file {
    width: 100%;
    padding: 10px 14px;
    border: 1.5px dashed #d3d8e0;
    border-radius: 10px;
    font-size: 13px;
    color: #4a5568;
    background: #fafbfc;
    cursor: pointer;
    font-family: inherit;
    transition: border-color 0.2s;
}
.c-form__file:hover {
    border-color: #4c7de6;
}
.c-form__total {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 11px 14px;
    background: #eef4ff;
    border: 1.5px solid #c7d8f8;
    border-radius: 10px;
    font-size: 18px;
    font-weight: 800;
    color: #1a1f36;
    letter-spacing: -0.3px;
}
.c-form__total i {
    font-size: 18px;
    color: #4c7de6;
}

/* Section Titles */
.c-form__section-title {
    font-size: 15px;
    font-weight: 700;
    color: #1a1f36;
    margin: 28px 0 16px;
    padding-bottom: 10px;
    border-bottom: 2px solid #eef0f4;
    display: flex;
    align-items: center;
    gap: 8px;
}
.c-form__section-title i {
    color: #4c7de6;
    font-size: 18px;
}

/* Security Notice */
.c-security-notice {
    display: flex;
    align-items: flex-start;
    gap: 10px;
    background: #f8fafc;
    border: 1px solid #eef0f4;
    border-radius: 12px;
    padding: 14px 18px;
    margin-bottom: 20px;
}
.c-security-notice > i {
    font-size: 18px;
    color: #10b981;
    flex-shrink: 0;
    margin-top: 2px;
}
.c-security-notice__text {
    display: block;
    font-size: 12.5px;
    color: #4a5568;
    font-weight: 500;
}
.c-security-notice__sub {
    display: block;
    font-size: 12px;
    color: #8b95a2;
    margin-top: 2px;
}

/* Checkboxes */
.c-form__check {
    display: flex;
    align-items: flex-start;
    gap: 10px;
    margin-bottom: 14px;
}
.c-form__check input[type="checkbox"] {
    width: 20px;
    height: 20px;
    flex-shrink: 0;
    accent-color: #4c7de6;
    margin-top: 2px;
    cursor: pointer;
}
.c-form__check label {
    font-size: 13px;
    color: #4a5568;
    line-height: 1.5;
    cursor: pointer;
    font-weight: 500;
}

/* Submit Button */
.c-form__submit {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    width: 100%;
    padding: 14px 24px;
    background: linear-gradient(135deg, #4c7de6 0%, #3b6dd4 100%);
    color: #fff;
    border: none;
    border-radius: 14px;
    font-size: 15px;
    font-weight: 700;
    font-family: inherit;
    cursor: pointer;
    margin-top: 28px;
    transition: all 0.25s ease;
    box-shadow: 0 4px 14px rgba(76,125,230,0.25);
}
.c-form__submit:hover {
    background: linear-gradient(135deg, #3b6dd4 0%, #2a5cc3 100%);
    box-shadow: 0 6px 20px rgba(76,125,230,0.35);
    transform: translateY(-1px);
}
.c-form__submit i {
    font-size: 18px;
}

/* Mobile Responsive */
@media (max-width: 640px) {
    .c-form__row--split {
        flex-direction: column;
        gap: 0;
    }
    .c-form__group--total {
        min-width: auto;
    }
    .c-page-title__heading {
        font-size: 22px;
    }
    .c-info-card__header {
        flex-direction: column;
        align-items: flex-start;
    }
}

@media (max-width: 991px) {
    .dashboard-nav { display: none !important; }
    .dashboard-wrapper { padding: 0 !important; }
    .dashboard-container { padding: 20px !important; }
}
</style>
@endpush

@push('script')
<script>
(function() {
    const pricePerUnit = {{ $contract['price_per_unit'] }};
    const minPct = {{ $contract['return_min_pct'] }};
    const maxPct = {{ $contract['return_max_pct'] }};
    const unitInput = document.getElementById('unitCount');
    const totalDisplay = document.getElementById('totalInvestment');
    const returnDisplay = document.getElementById('returnRange');
    const plannedLabel = document.getElementById('plannedAmountLabel');

    function formatMoney(n) {
        return '$' + n.toLocaleString('en-US');
    }

    function recalculate() {
        const units = parseInt(unitInput.value) || 0;
        const total = units * pricePerUnit;
        const minReturn = Math.round(total * minPct / 100);
        const maxReturn = Math.round(total * maxPct / 100);

        totalDisplay.innerHTML = formatMoney(total) + ' <i class="las la-calculator"></i>';
        plannedLabel.textContent = formatMoney(total);
        returnDisplay.innerHTML =
            minPct + '% of ' + formatMoney(total) + ' = ' + formatMoney(minReturn) +
            ' &nbsp;–&nbsp; ' +
            maxPct + '% of ' + formatMoney(total) + ' = ' + formatMoney(maxReturn);
    }

    unitInput.addEventListener('input', recalculate);

    // Form submit handler (visual only for now)
    document.getElementById('contractForm').addEventListener('submit', function(e) {
        e.preventDefault();
        alert('Your contract request has been submitted! Our compliance team will review it within 24 hours.');
    });
})();
</script>
@endpush
@endsection
