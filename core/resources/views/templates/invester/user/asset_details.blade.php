@extends('Template::layouts.master')
@section('content')
<div class="asset-details-inner">
    {{-- Header Navigation --}}
    <div class="a-header">
        <a href="{{ route('user.home') }}" class="a-header__back">
            <i class="las la-arrow-left"></i>
        </a>
        <div class="a-header__menu">
            <i class="las la-ellipsis-h"></i>
        </div>
    </div>

    {{-- Asset Main Info --}}
    <div class="a-main">
        <div class="a-main__icon a-main__icon--{{ $asset['color'] }}">
            <i class="las {{ $asset['icon'] }}"></i>
        </div>
        <div class="a-main__label">@lang('YOUR ' . strtoupper($asset['name']) . ' BALANCE')</div>
        <div class="a-main__balance">
            <span class="a-main__amount">${{ $asset['amount'] }}</span>
            <span class="a-main__eye">
                <i class="las la-eye-slash"></i>
            </span>
        </div>
    </div>

    {{-- Action Buttons --}}
    <div class="a-actions">
        <a href="javascript:void(0)" class="a-btn">
            <div class="a-btn__icon"><i class="las la-paper-plane"></i></div>
            <span class="a-btn__text">@lang('Send')</span>
        </a>
        <a href="javascript:void(0)" class="a-btn">
            <div class="a-btn__icon"><i class="las la-sync"></i></div>
            <span class="a-btn__text">@lang('Convert')</span>
        </a>
        <a href="{{ route('user.withdraw') }}" class="a-btn">
            <div class="a-btn__icon"><i class="las la-wallet"></i></div>
            <span class="a-btn__text">@lang('Withdraw')</span>
        </a>
    </div>

    {{-- Invest Section --}}
    <div class="a-invest-sec">
        <h5 class="a-invest-sec__title">@lang('Invest')</h5>
        <p class="a-invest-sec__desc">@lang('Expand your wealth with our tailored investment plans in ' . $asset['name'])</p>
        
        <div class="a-banner">
            <div class="a-banner__content">
                <h6 class="a-banner__title">@lang('Invest in ' . $asset['name'])</h6>
                <p class="a-banner__text">@lang('Open a customized ' . $asset['name'] . ' portfolio to start growing your assets globally.')</p>
                <div class="a-banner__buttons">
                    <a href="{{ route('user.deposit.index') }}?asset={{ $type }}" class="a-banner__btn">
                        @lang('Invest')
                        <i class="las la-angle-right"></i>
                    </a>
                    @if($type !== 'stocks')
                    <a href="{{ route('user.asset.contract', $type) }}" class="a-banner__btn a-banner__btn--outline">
                        @lang('Contract')
                        <i class="las la-file-contract"></i>
                    </a>
                    @endif
                </div>
            </div>
            <div class="a-banner__visual">
                <i class="las {{ $asset['icon'] }}"></i>
            </div>
        </div>
    </div>
</div>

@push('style')
<style>
    /* Premium Asset Details Layout */
    .asset-details-inner {
        font-family: 'Inter', sans-serif;
        max-width: 800px;
        margin: 0 auto;
        padding-top: 20px;
    }

    /* Header */
    .a-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
        padding: 0 5px;
    }
    .a-header__back, .a-header__menu {
        width: 42px;
        height: 42px;
        border-radius: 50%;
        background: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #1a202c;
        font-size: 20px;
        text-decoration: none !important;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        transition: all 0.2s;
        cursor: pointer;
    }
    .a-header__back:hover {
        background: #f8fafc;
        transform: translateX(-2px);
    }

    /* Main Info */
    .a-main {
        text-align: center;
        margin-bottom: 40px;
    }
    .a-main__icon {
        width: 70px;
        height: 70px;
        border-radius: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 15px;
        font-size: 34px;
        box-shadow: 0 10px 20px rgba(0,0,0,0.05);
    }
    .a-main__icon--emerald { background: #ecfdf5; color: #10b981; }
    .a-main__icon--amber { background: #fffbeb; color: #f59e0b; }
    .a-main__icon--indigo { background: #eef2ff; color: #6366f1; }
    .a-main__icon--rose { background: #fff1f2; color: #f43f5e; }

    .a-main__label {
        font-size: 11px;
        font-weight: 700;
        color: #a3acb9;
        letter-spacing: 0.5px;
        margin-bottom: 8px;
    }
    .a-main__balance {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 12px;
    }
    .a-main__amount {
        font-size: 40px;
        font-weight: 800;
        color: #1a1f36;
        letter-spacing: -1px;
    }
    .a-main__eye {
        font-size: 22px;
        color: #adb5bd;
        cursor: pointer;
    }

    /* Actions */
    .a-actions {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-bottom: 50px;
    }
    .a-btn {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 8px;
        text-decoration: none !important;
        transition: all 0.2s;
    }
    .a-btn:hover {
        transform: translateY(-2px);
    }
    .a-btn__icon {
        width: 54px;
        height: 54px;
        border-radius: 50%;
        border: 1px solid #eef0f4;
        background: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 22px;
        color: #1a1f36;
        box-shadow: 0 4px 12px rgba(0,0,0,0.03);
    }
    .a-btn__text {
        font-size: 12px;
        font-weight: 600;
        color: #4a5568;
    }

    /* Invest Section */
    .a-invest-sec__title {
        font-size: 18px;
        font-weight: 800;
        color: #1a1f36;
        margin-bottom: 5px;
    }
    .a-invest-sec__desc {
        font-size: 13.5px;
        color: #707a8a;
        margin-bottom: 20px;
    }

    /* Banner */
    .a-banner {
        background: linear-gradient(135deg, #f8fafc 0%, #eff6ff 100%);
        border-radius: 24px;
        padding: 25px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: relative;
        overflow: hidden;
        border: 1px solid rgba(255,255,255,0.8);
        box-shadow: 0 10px 30px rgba(0,0,0,0.04);
    }
    .a-banner__content {
        max-width: 65%;
        position: relative;
        z-index: 2;
    }
    .a-banner__title {
        font-size: 16px;
        font-weight: 800;
        color: #1a1f36;
        margin-bottom: 8px;
    }
    .a-banner__text {
        font-size: 12.5px;
        line-height: 1.5;
        color: #64748b;
        margin-bottom: 15px;
        font-weight: 500;
    }

    /* Banner Buttons Container */
    .a-banner__buttons {
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
    }

    .a-banner__btn {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        background: #4c7de6;
        color: #fff !important;
        padding: 10px 18px;
        border-radius: 12px;
        font-size: 13px;
        font-weight: 600;
        text-decoration: none !important;
        transition: all 0.25s ease;
        border: 2px solid #4c7de6;
    }
    .a-banner__btn i { font-size: 15px; }
    .a-banner__btn:hover {
        background: #3b6dd4;
        border-color: #3b6dd4;
        box-shadow: 0 5px 15px rgba(76,125,230,0.3);
        transform: translateY(-1px);
    }

    /* Outline variant for Contract button */
    .a-banner__btn--outline {
        background: transparent;
        color: #4c7de6 !important;
        border: 2px solid #4c7de6;
    }
    .a-banner__btn--outline:hover {
        background: #4c7de6;
        color: #fff !important;
        border-color: #4c7de6;
        box-shadow: 0 5px 15px rgba(76,125,230,0.3);
    }

    .a-banner__visual {
        font-size: 100px;
        color: #4c7de6;
        opacity: 0.08;
        position: absolute;
        right: -10px;
        top: 50%;
        transform: translateY(-50%) rotate(-15deg);
        z-index: 1;
    }

    /* Mobile Responsive */
    @media (max-width: 991px) {
        .dashboard-nav { display: none !important; }
        .dashboard-wrapper { padding: 0 !important; }
        .dashboard-container { padding: 20px !important; }
        
        .a-main__amount { font-size: 42px; }
        .a-banner { padding: 20px; }
        .a-banner__content { max-width: 100%; }
        .a-banner__visual { font-size: 120px; opacity: 0.1; }
    }
</style>
@endpush
@endsection
