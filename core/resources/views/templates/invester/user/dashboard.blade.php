@extends('Template::layouts.master')
@section('content')
    @php
        $kyc = getContent('kyc.content', true);
    @endphp

    <div class="dashboard-inner">

        {{-- Mobile Header (only visible on mobile) --}}
        <div class="g-mobile-header">
            <div class="g-mobile-header__avatar">
                {{ getInitials(auth()->user()->fullname) }}
            </div>
            <div class="g-mobile-header__right">
                <a href="{{ route('user.profile.setting') }}" class="g-mobile-header__icon-btn">
                    <i class="las la-cog"></i>
                </a>
                <a href="{{ route('user.referrals') }}" class="g-mobile-header__earn">
                    <i class="las la-bolt"></i> @lang('Earn')
                </a>
            </div>
        </div>

        {{-- Desktop Greeting (hidden on mobile) --}}
        <div class="g-greeting">
            <h4 class="g-greeting__title">@lang('Hello') {{ $user->firstname }}, 👋</h4>
            <p class="g-greeting__sub">@lang('Send, save and receive funds in various currencies')</p>
        </div>

        {{-- Notification Alerts --}}
        <div class="g-notices-wrapper">
            @if ($user->kv == Status::KYC_UNVERIFIED && $user->kyc_rejection_reason)
                <div class="g-notice g-notice--danger">
                    <div class="g-notice__icon"><i class="fas fa-times-circle"></i></div>
                    <div class="g-notice__body">
                        <strong>@lang('KYC Documents Rejected')</strong>
                        <span>{{ __(@$kyc->data_values->reject) }}
                            <a href="javascript::void(0)" data-bs-toggle="modal" data-bs-target="#kycRejectionReason">@lang('Click here')</a> @lang('to show the reason').
                            <a href="{{ route('user.kyc.form') }}">@lang('Click Here')</a> @lang('to Re-submit Documents').
                            <a href="{{ route('user.kyc.data') }}">@lang('See KYC Data')</a>
                        </span>
                    </div>
                </div>
            @elseif($user->kv == Status::KYC_UNVERIFIED)
                <div class="g-notice g-notice--info">
                    <div class="g-notice__icon"><i class="fas fa-exclamation-circle"></i></div>
                    <div class="g-notice__body">
                        <strong>@lang('KYC Verification Required')</strong>
                        <span>{{ __(@$kyc->data_values->required) }} <a href="{{ route('user.kyc.form') }}">@lang('Click Here to Submit Documents')</a></span>
                    </div>
                </div>
            @elseif($user->kv == Status::KYC_PENDING)
                <div class="g-notice g-notice--warning">
                    <div class="g-notice__icon"><i class="las la-hourglass-half"></i></div>
                    <div class="g-notice__body">
                        <strong>@lang('KYC Verification Pending')</strong>
                        <span>{{ __(@$kyc->data_values->pending) }} <a href="{{ route('user.kyc.data') }}">@lang('See KYC Data')</a></span>
                    </div>
                </div>
            @endif

            @if ($user->deposit_wallet <= 0 && $user->interest_wallet <= 0)
                <div class="g-notice g-notice--danger">
                    <div class="g-notice__icon"><i class="fas fa-exclamation-triangle"></i></div>
                    <div class="g-notice__body">
                        <strong>@lang('Empty Balance')</strong>
                        <span>@lang('Your balance is empty. Please make') <a href="{{ route('user.deposit.index') }}">@lang('deposit')</a> @lang('for your next investment.')</span>
                    </div>
                </div>
            @endif

            @if ($user->deposits->where('status', 1)->count() == 1 && !$user->invests->count())
                <div class="g-notice g-notice--success">
                    <div class="g-notice__icon"><i class="fas fa-check"></i></div>
                    <div class="g-notice__body">
                        <strong>@lang('First Deposit')</strong>
                        <span><b>@lang('Congratulations!')</b> @lang('You\'ve made your first deposit successfully. Go to') <a href="{{ route('plan') }}">@lang('investment plan')</a> @lang('page and invest now')</span>
                    </div>
                </div>
            @endif

            @if ($pendingWithdrawals)
                <div class="g-notice g-notice--primary">
                    <div class="g-notice__icon"><i class="fas fa-spinner"></i></div>
                    <div class="g-notice__body">
                        <strong>@lang('Withdrawal Pending')</strong>
                        <span>@lang('Total') {{ showAmount($pendingWithdrawals) }} @lang('withdrawal request is pending.') <a href="{{ route('user.withdraw.history') }}">@lang('withdrawal history')</a></span>
                    </div>
                </div>
            @endif

            @if ($pendingDeposits)
                <div class="g-notice g-notice--primary">
                    <div class="g-notice__icon"><i class="fas fa-spinner"></i></div>
                    <div class="g-notice__body">
                        <strong>@lang('Deposit Pending')</strong>
                        <span>@lang('Total') {{ showAmount($pendingDeposits) }} @lang('deposit request is pending.') <a href="{{ route('user.deposit.history') }}">@lang('deposit history')</a></span>
                    </div>
                </div>
            @endif

            @if (!$user->ts)
                <div class="g-notice g-notice--warning">
                    <div class="g-notice__icon"><i class="fas fa-user-lock"></i></div>
                    <div class="g-notice__body">
                        <strong>@lang('2FA Authentication')</strong>
                        <span>@lang('To keep safe your account, Please enable') <a href="{{ route('user.twofactor') }}">@lang('2FA')</a> @lang('security'). @lang('It will make secure your account and balance.')</span>
                    </div>
                </div>
            @endif

            @if ($isHoliday)
                <div class="g-notice g-notice--info">
                    <div class="g-notice__icon"><i class="fas fa-toggle-off"></i></div>
                    <div class="g-notice__body">
                        <strong>@lang('Holiday')</strong>
                        <span>@lang('Today is holiday on this system. You\'ll not get any interest today.') @lang('The next working day is coming after') <span id="counter" class="fw-bold text--primary fs--15px"></span></span>
                    </div>
                </div>
            @endif
        </div>

        {{-- Total Balance Card --}}
        <div class="g-balance">
            <div class="g-balance__info">
                <span class="g-balance__label">@lang('TOTAL BALANCE') 💰</span>
                <h2 class="g-balance__amount">{{ showAmount($user->deposit_wallet + $user->interest_wallet) }}</h2>
            </div>
            <div class="g-balance__btns">
                <a href="{{ route('user.deposit.index') }}" class="g-balance__btn">
                    <span class="g-balance__btn-circle">
                        <i class="las la-plus"></i>
                    </span>
                    <span class="g-balance__btn-label">@lang('Add money')</span>
                </a>
                <a href="{{ route('user.withdraw') }}" class="g-balance__btn">
                    <span class="g-balance__btn-circle">
                        <i class="las la-arrow-up" style="transform:rotate(45deg)"></i>
                    </span>
                    <span class="g-balance__btn-label">@lang('Send')</span>
                </a>
                @if (gs('b_transfer'))
                <a href="{{ route('user.transfer.balance') }}" class="g-balance__btn">
                    <span class="g-balance__btn-circle">
                        <i class="las la-sync-alt"></i>
                    </span>
                    <span class="g-balance__btn-label">@lang('Convert')</span>
                </a>
                @endif
            </div>
        </div>

        {{-- My Balances --}}
        <h5 class="g-sec-title">@lang('My Balances')</h5>
        <div class="g-cards-wrap">
            <div class="g-cards" id="balanceCards">
                {{-- Deposit Wallet --}}
                <div class="g-card">
                    <div class="g-card__flag g-card__flag--blue">
                        <i class="las la-wallet"></i>
                    </div>
                    <span class="g-card__name">@lang('Deposit Wallet')</span>
                    <h3 class="g-card__amount">{{ showAmount($user->deposit_wallet) }}</h3>
                </div>

                {{-- Interest Wallet --}}
                <div class="g-card">
                    <div class="g-card__flag g-card__flag--green">
                        <i class="las la-coins"></i>
                    </div>
                    <span class="g-card__name">@lang('Interest Wallet')</span>
                    <h3 class="g-card__amount">{{ showAmount($user->interest_wallet) }}</h3>
                </div>

                {{-- Successful Deposits --}}
                <div class="g-card">
                    <div class="g-card__flag g-card__flag--purple">
                        <i class="las la-arrow-down"></i>
                    </div>
                    <span class="g-card__name">@lang('Successful Deposits')</span>
                    <h3 class="g-card__amount">{{ showAmount($successfulDeposits) }}</h3>
                </div>

                {{-- Successful Withdrawals --}}
                <div class="g-card">
                    <div class="g-card__flag g-card__flag--orange">
                        <i class="las la-arrow-up"></i>
                    </div>
                    <span class="g-card__name">@lang('Successful Withdrawals')</span>
                    <h3 class="g-card__amount">{{ showAmount($successfulWithdrawals) }}</h3>
                </div>

                {{-- Total Investments --}}
                <div class="g-card">
                    <div class="g-card__flag g-card__flag--teal">
                        <i class="las la-chart-line"></i>
                    </div>
                    <span class="g-card__name">@lang('Total Investments')</span>
                    <h3 class="g-card__amount">{{ showAmount($invests) }}</h3>
                </div>

                {{-- Total Interests --}}
                <div class="g-card">
                    <div class="g-card__flag g-card__flag--pink">
                        <i class="las la-percentage"></i>
                    </div>
                    <span class="g-card__name">@lang('Total Interests')</span>
                    <h3 class="g-card__amount">{{ showAmount($interests) }}</h3>
                </div>
            </div>
            <button class="g-cards__arrow" id="scrollRight" aria-label="Scroll right">
                <i class="las la-angle-right"></i>
            </button>
        </div>

        {{-- Assets Section - Horizontal Scroll --}}
        <h5 class="g-sec-title">@lang('Assets')</h5>
        <div class="g-assets-wrap">
            <div class="g-assets" id="assetsScroll">
                {{-- Real Estate --}}
                <a href="{{ route('user.asset.details', 'real-estate') }}" class="g-asset">
                    <div class="g-asset__top">
                        <div class="g-asset__icon g-asset__icon--emerald">
                            <i class="las la-building"></i>
                        </div>
                        <div class="g-asset__title-box">
                            <h6 class="g-asset__name">@lang('Real Estate')</h6>
                            <span class="g-asset__ticker">RE</span>
                        </div>
                    </div>
                    <div class="g-asset__middle">
                        <h3 class="g-asset__amount">${{ number_format($assetBalances['real-estate']['amount'] ?? 0, 2) }}</h3>
                    </div>
                    <div class="g-asset__bottom">
                        <i class="las la-building"></i>
                        <span class="g-asset__subtext">@lang('Real Estate')</span>
                    </div>
                </a>

                {{-- Oil & Gas --}}
                <a href="{{ route('user.asset.details', 'oil-gas') }}" class="g-asset">
                    <div class="g-asset__top">
                        <div class="g-asset__icon g-asset__icon--amber">
                            <i class="las la-oil-can"></i>
                        </div>
                        <div class="g-asset__title-box">
                            <h6 class="g-asset__name">@lang('Oil & Gas')</h6>
                            <span class="g-asset__ticker">OIL</span>
                        </div>
                    </div>
                    <div class="g-asset__middle">
                        <h3 class="g-asset__amount">${{ number_format($assetBalances['oil-gas']['amount'] ?? 0, 2) }}</h3>
                    </div>
                    <div class="g-asset__bottom">
                        <i class="las la-oil-can"></i>
                        <span class="g-asset__subtext">@lang('Oil & Gas')</span>
                    </div>
                </a>

                {{-- Investment Banking --}}
                <a href="{{ route('user.asset.details', 'investment-banking') }}" class="g-asset">
                    <div class="g-asset__top">
                        <div class="g-asset__icon g-asset__icon--indigo">
                            <i class="las la-university"></i>
                        </div>
                        <div class="g-asset__title-box">
                            <h6 class="g-asset__name">@lang('Investment Banking')</h6>
                            <span class="g-asset__ticker">IB</span>
                        </div>
                    </div>
                    <div class="g-asset__middle">
                        <h3 class="g-asset__amount">${{ number_format($assetBalances['investment-banking']['amount'] ?? 0, 2) }}</h3>
                    </div>
                    <div class="g-asset__bottom">
                        <i class="las la-university"></i>
                        <span class="g-asset__subtext">@lang('Investment Banking')</span>
                    </div>
                </a>

                {{-- Stocks --}}
                <a href="{{ route('user.asset.details', 'stocks') }}" class="g-asset">
                    <div class="g-asset__top">
                        <div class="g-asset__icon g-asset__icon--rose">
                            <i class="las la-chart-line"></i>
                        </div>
                        <div class="g-asset__title-box">
                            <h6 class="g-asset__name">@lang('Stocks')</h6>
                            <span class="g-asset__ticker">STX</span>
                        </div>
                    </div>
                    <div class="g-asset__middle">
                        <h3 class="g-asset__amount">${{ number_format($assetBalances['stocks']['amount'] ?? 0, 2) }}</h3>
                    </div>
                    <div class="g-asset__bottom">
                        <i class="las la-chart-line"></i>
                        <span class="g-asset__subtext">@lang('Stocks')</span>
                    </div>
                </a>
            </div>
        </div>

        {{-- Quick Actions --}}
        <h5 class="g-sec-title">@lang('Quick Actions')</h5>
        <div class="g-actions">
            <a href="{{ route('plan') }}" class="g-action">
                <div class="g-action__icon g-action__icon--blue">
                    <i class="las la-chart-bar"></i>
                </div>
                <div class="g-action__info">
                    <h6 class="g-action__name">@lang('Invest Now')</h6>
                    <p class="g-action__desc">@lang('Browse investment plans and start earning')</p>
                </div>
            </a>
            <a href="{{ route('user.deposit.index') }}" class="g-action">
                <div class="g-action__icon g-action__icon--green">
                    <i class="las la-plus-circle"></i>
                </div>
                <div class="g-action__info">
                    <h6 class="g-action__name">@lang('Deposit')</h6>
                    <p class="g-action__desc">@lang('Fund your wallet to start investing')</p>
                </div>
            </a>
            <a href="{{ route('user.withdraw') }}" class="g-action">
                <div class="g-action__icon g-action__icon--orange">
                    <i class="las la-money-bill-wave"></i>
                </div>
                <div class="g-action__info">
                    <h6 class="g-action__name">@lang('Withdraw')</h6>
                    <p class="g-action__desc">@lang('Withdraw your earnings securely')</p>
                </div>
            </a>
            <a href="{{ route('user.transactions') }}" class="g-action">
                <div class="g-action__icon g-action__icon--red">
                    <i class="las la-receipt"></i>
                </div>
                <div class="g-action__info">
                    <h6 class="g-action__name">@lang('Transactions')</h6>
                    <p class="g-action__desc">@lang('View all your transaction history')</p>
                </div>
            </a>
        </div>

        {{-- ROI Chart --}}
        <div class="g-chart">
            <div class="g-chart__head">
                <h5 class="g-chart__title">@lang('Latest ROI Statistics')</h5>
                <p class="g-chart__sub">@lang('Here is last 30 days statistics of your ROI (Return on Investment)')</p>
            </div>
            <div id="chart"></div>
        </div>
    </div>



    @if ($user->kv == Status::KYC_UNVERIFIED && $user->kyc_rejection_reason)
        <div class="modal fade" id="kycRejectionReason">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">@lang('KYC Document Rejection Reason')</h5>
                        <button type="button" class="close" data-bs-dismiss="modal">
                            <i class="las la-times"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>{{ $user->kyc_rejection_reason }}</p>
                    </div>
                </div>
            </div>
        </div>
    @endif
@endsection

@push('style')
<style>
/* =========================================
   Grey Finance App - Dashboard
   ========================================= */

.dashboard-inner {
    font-family: 'Inter', 'Maven Pro', sans-serif;
}

/* --- Mobile Header (hidden on desktop) --- */
.g-mobile-header {
    display: none;
}

/* --- Greeting --- */
.g-greeting {
    padding: 8px 0 20px;
}
.g-greeting__title {
    font-size: 20px;
    font-weight: 700;
    color: #0f1419;
    margin: 0 0 2px;
    letter-spacing: -0.3px;
}
.g-greeting__sub {
    font-size: 13px;
    color: #8b95a2;
    margin: 0;
    font-weight: 400;
}

/* --- Notices --- */
.g-notices-wrapper {
    margin-bottom: 6px;
}
.g-notice {
    display: flex;
    align-items: flex-start;
    gap: 12px;
    padding: 13px 16px;
    border-radius: 10px;
    background: #fff;
    border: 1px solid #ebeef2;
    margin-bottom: 10px;
}
.g-notice__icon {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    font-size: 14px;
}
.g-notice--danger .g-notice__icon { background: #fff5f5; color: #e53e3e; }
.g-notice--warning .g-notice__icon { background: #fffaf0; color: #ed8936; }
.g-notice--success .g-notice__icon { background: #f0fff4; color: #38a169; }
.g-notice--info .g-notice__icon { background: #ebf8ff; color: #3182ce; }
.g-notice--primary .g-notice__icon { background: #ebf4ff; color: #4c7de6; }
.g-notice__body {
    flex: 1;
    min-width: 0;
}
.g-notice__body strong {
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: #0f1419;
    margin-bottom: 1px;
}
.g-notice__body span {
    font-size: 12.5px;
    color: #8b95a2;
    line-height: 1.5;
}
.g-notice__body a {
    color: #4c7de6;
    font-weight: 500;
    text-decoration: none;
}
.g-notice__body a:hover {
    text-decoration: underline;
}

/* --- Total Balance Card --- */
.g-balance {
    background: #f7f8fa;
    border-radius: 14px;
    padding: 28px 30px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 20px;
    margin-top: 10px;
    margin-bottom: 34px;
    border: 1px solid #eef0f4;
}
.g-balance__label {
    font-size: 12px;
    color: #8b95a2;
    font-weight: 600;
    display: block;
    margin-bottom: 4px;
    letter-spacing: 0.5px;
    text-transform: uppercase;
}
.g-balance__amount {
    font-size: 30px;
    font-weight: 700;
    color: #0f1419;
    margin: 0;
    letter-spacing: -0.5px;
}
.g-balance__btns {
    display: flex;
    gap: 20px;
}
.g-balance__btn {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 7px;
    text-decoration: none;
    transition: all 0.2s;
}
.g-balance__btn:hover {
    text-decoration: none;
    transform: translateY(-2px);
}
.g-balance__btn-circle {
    width: 46px;
    height: 46px;
    border-radius: 50%;
    border: 1.5px solid #d3d8e0;
    background: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    color: #0f1419;
    transition: all 0.2s;
}
.g-balance__btn:hover .g-balance__btn-circle {
    border-color: #4c7de6;
    color: #4c7de6;
    box-shadow: 0 2px 10px rgba(76,125,230,0.12);
}
.g-balance__btn-label {
    font-size: 12px;
    color: #5f6d7e;
    font-weight: 500;
}

/* --- Section Title --- */
.g-sec-title {
    font-size: 16px;
    font-weight: 700;
    color: #0f1419;
    margin: 0 0 14px;
}

/* --- Scrollable Balance Cards --- */
.g-cards-wrap {
    position: relative;
    margin-bottom: 36px;
}
.g-cards {
    display: flex;
    gap: 14px;
    overflow-x: auto;
    scroll-behavior: smooth;
    padding-bottom: 6px;
    cursor: grab;
    -ms-overflow-style: none;
    scrollbar-width: none;
}
.g-cards::-webkit-scrollbar {
    display: none;
}
.g-card {
    min-width: 180px;
    background: #fff;
    border: 1px solid #eef0f4;
    border-radius: 12px;
    padding: 20px;
    flex-shrink: 0;
    transition: all 0.2s;
}
.g-card:hover {
    box-shadow: 0 3px 14px rgba(0,0,0,0.05);
    border-color: #dde1e8;
}
.g-card__flag {
    width: 36px;
    height: 36px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    margin-bottom: 14px;
}
.g-card__flag--blue { background: #eef4ff; color: #4c7de6; }
.g-card__flag--green { background: #ecfdf5; color: #10b981; }
.g-card__flag--purple { background: #f3f0ff; color: #7c3aed; }
.g-card__flag--orange { background: #fff7ed; color: #f59e0b; }
.g-card__flag--teal { background: #f0fdfa; color: #14b8a6; }
.g-card__flag--pink { background: #fdf2f8; color: #ec4899; }
.g-card__name {
    display: block;
    font-size: 12px;
    color: #8b95a2;
    font-weight: 500;
    margin-bottom: 4px;
}
.g-card__amount {
    font-size: 20px;
    font-weight: 700;
    color: #0f1419;
    margin: 0;
    letter-spacing: -0.3px;
}

/* Scroll arrow */
.g-cards__arrow {
    position: absolute;
    top: 50%;
    right: -6px;
    transform: translateY(-50%);
    width: 32px;
    height: 32px;
    border-radius: 50%;
    background: #fff;
    border: 1px solid #e2e5ea;
    box-shadow: 0 1px 6px rgba(0,0,0,0.07);
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    font-size: 16px;
    color: #5f6d7e;
    z-index: 2;
    transition: all 0.2s;
}
.g-cards__arrow:hover {
    background: #f7f8fa;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1);
}

/* --- Quick Actions --- */
.g-actions {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 14px;
    margin-bottom: 34px;
}
.g-action {
    background: #fff;
    border: 1px solid #eef0f4;
    border-radius: 12px;
    padding: 18px;
    text-decoration: none;
    display: flex;
    align-items: flex-start;
    gap: 12px;
    transition: all 0.2s;
}
.g-action:hover {
    box-shadow: 0 3px 14px rgba(0,0,0,0.05);
    border-color: #dde1e8;
    text-decoration: none;
    transform: translateY(-1px);
}
.g-action__icon {
    width: 40px;
    height: 40px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    flex-shrink: 0;
}
.g-action__icon--blue { background: #eef4ff; color: #4c7de6; }
.g-action__icon--green { background: #ecfdf5; color: #10b981; }
.g-action__icon--orange { background: #fff7ed; color: #f59e0b; }
.g-action__icon--red { background: #fff5f5; color: #e53e3e; }
.g-action__info { min-width: 0; }
.g-action__name {
    font-size: 13px;
    font-weight: 600;
    color: #0f1419;
    margin: 0 0 3px;
}
.g-action__desc {
    font-size: 11.5px;
    color: #8b95a2;
    margin: 0;
    line-height: 1.45;
}

/* --- Chart Card --- */
.g-chart {
    background: #fff;
    border: 1px solid #eef0f4;
    border-radius: 12px;
    padding: 22px;
    margin-bottom: 24px;
}
.g-chart__head {
    margin-bottom: 18px;
}
.g-chart__title {
    font-size: 16px;
    font-weight: 700;
    color: #0f1419;
    margin: 0 0 3px;
}
.g-chart__sub {
    font-size: 12.5px;
    color: #8b95a2;
    margin: 0;
}
/* --- Assets Section (horizontal scroll) --- */
.g-assets-wrap {
    margin-bottom: 28px;
}
.g-assets {
    display: flex;
    gap: 14px;
    overflow-x: auto;
    scroll-snap-type: x mandatory;
    -webkit-overflow-scrolling: touch;
    padding-bottom: 6px;
    scrollbar-width: none;
    -ms-overflow-style: none;
}
.g-assets::-webkit-scrollbar {
    display: none;
}
.g-asset {
    min-width: 200px;
    flex-shrink: 0;
    scroll-snap-align: start;
    background: #ffffff;
    border: 1px solid #f0f2f5;
    border-radius: 20px;
    padding: 22px;
    text-decoration: none !important;
    display: flex;
    flex-direction: column;
    gap: 12px;
    transition: all 0.3s ease;
    box-shadow: 0 2px 8px rgba(0,0,0,0.02);
}
.g-asset:hover {
    box-shadow: 0 8px 24px rgba(0,0,0,0.06);
    border-color: #e5e9f0;
    transform: translateY(-2px);
    text-decoration: none;
}
.g-asset__top {
    display: flex;
    align-items: center;
    gap: 12px;
}
.g-asset__icon {
    width: 38px;
    height: 38px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    flex-shrink: 0;
}
.g-asset__icon--emerald { background: #ecfdf5; color: #10b981; }
.g-asset__icon--amber { background: #fffbeb; color: #f59e0b; }
.g-asset__icon--indigo { background: #eef2ff; color: #6366f1; }
.g-asset__icon--rose { background: #fff1f2; color: #f43f5e; }

.g-asset__title-box {
    min-width: 0;
}
.g-asset__name {
    font-size: 14px;
    font-weight: 700;
    color: #1a1f36;
    margin: 0;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 1.2;
}
.g-asset__ticker {
    font-size: 10px;
    color: #a3acb9;
    display: block;
    text-transform: uppercase;
    font-weight: 600;
    margin-top: 1px;
}
.g-asset__middle {
    margin-top: 15px;
}
.g-asset__amount {
    font-size: 26px;
    font-weight: 800;
    color: #1a202c;
    letter-spacing: -0.7px;
    margin: 0;
    line-height: 1;
}
.g-asset__bottom {
    display: flex;
    align-items: center;
    gap: 8px;
    opacity: 0.7;
}
.g-asset__bottom i {
    font-size: 14px;
    color: #adb5bd;
}
.g-asset__subtext {
    font-size: 11px;
    color: #adb5bd;
    font-weight: 600;
    text-transform: capitalize;
}


.g-tab-bar {
    display: none;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    background: #ffffff;
    border-top: 1px solid #ebeef2;
    padding: 6px 0;
    padding-bottom: calc(6px + env(safe-area-inset-bottom, 0px));
    z-index: 99999;
    justify-content: space-around;
    align-items: center;
    box-shadow: 0 -2px 16px rgba(0,0,0,0.06);
    font-family: 'Inter', 'Maven Pro', sans-serif;
}
.g-tab-bar__item {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 2px;
    text-decoration: none !important;
    color: #8b95a2;
    font-size: 10px;
    font-weight: 500;
    padding: 4px 10px;
    transition: color 0.2s;
    position: relative;
    -webkit-tap-highlight-color: transparent;
}
.g-tab-bar__item i {
    font-size: 22px;
    line-height: 1;
}
.g-tab-bar__item--active {
    color: #4c7de6;
}
.g-tab-bar__item--active::after {
    content: '';
    position: absolute;
    top: -6px;
    left: 50%;
    transform: translateX(-50%);
    width: 5px;
    height: 5px;
    border-radius: 50%;
    background: #4c7de6;
}
.g-tab-bar__item:hover {
    color: #4c7de6;
    text-decoration: none;
}

/* Hide old widgets */
.dashboard-widget { display: none !important; }

/* Hide Laravel Debugbar on mobile */
@media (max-width: 991px) {
    #phpdebugbar,
    .phpdebugbar-openhandler,
    .debugbar,
    div[id^="debugbar"],
    .__sf-toolbar,
    [class*="debugbar"],
    .sf-toolbar {
        display: none !important;
        visibility: hidden !important;
        opacity: 0 !important;
        height: 0 !important;
        overflow: hidden !important;
    }
}

/* ============================================
   TABLET RESPONSIVE (max-width: 1199px)
   ============================================ */
@media (max-width: 1199px) {
    .g-actions {
        grid-template-columns: repeat(2, 1fr);
    }
}

/* ============================================
   MOBILE / TABLET RESPONSIVE (max-width: 991px)
   Show bottom tab bar, mobile header, hide topbar
   ============================================ */
@media (max-width: 991px) {
    /* Show bottom tab bar */
    .g-tab-bar {
        display: flex !important;
    }

    /* Hide topbar */
    .dashboard-nav,
    .dashboard-nav.d-flex {
        display: none !important;
    }

    /* Show mobile header */
    .g-mobile-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 6px 0 18px;
    }

    /* Hide desktop greeting */
    .g-greeting {
        display: none !important;
    }

    /* Pad bottom of container for tab bar */
    .dashboard-container,
    .dashboard-container-fluid {
        padding-bottom: 90px !important;
    }
}

/* ============================================
   MOBILE LAYOUT (max-width: 767px)
   ============================================ */
@media (max-width: 767px) {

    /* Mobile Header */
    .g-mobile-header__avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: #eef0f4;
        color: #5f6d7e;
        font-size: 14px;
        font-weight: 700;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 2px solid #fff;
        box-shadow: 0 1px 4px rgba(0,0,0,0.08);
    }
    .g-mobile-header__right {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .g-mobile-header__icon-btn {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        background: #f3f4f6;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #5f6d7e;
        font-size: 18px;
        text-decoration: none;
        transition: all 0.2s;
    }
    .g-mobile-header__icon-btn:hover {
        background: #e5e7eb;
        color: #0f1419;
    }
    .g-mobile-header__earn {
        display: flex;
        align-items: center;
        gap: 4px;
        background: #4c7de6;
        color: #fff;
        padding: 8px 14px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 600;
        text-decoration: none;
        transition: all 0.2s;
    }
    .g-mobile-header__earn i {
        font-size: 14px;
    }
    .g-mobile-header__earn:hover {
        background: #3b6dd4;
        color: #fff;
        text-decoration: none;
    }

    /* Balance - centered like Grey mobile */
    .g-balance {
        background: transparent;
        border: none;
        flex-direction: column;
        align-items: center;
        text-align: center;
        padding: 10px 0 24px;
        margin-bottom: 20px;
        gap: 16px;
    }
    .g-balance__info {
        text-align: center;
    }
    .g-balance__label {
        font-size: 11px;
        letter-spacing: 1px;
    }
    .g-balance__amount {
        font-size: 34px;
        letter-spacing: -1px;
    }
    .g-balance__btns {
        gap: 24px;
        justify-content: center;
    }
    .g-balance__btn-circle {
        width: 50px;
        height: 50px;
        font-size: 22px;
    }
    .g-balance__btn-label {
        font-size: 11px;
    }

    /* Cards - 2 column grid on mobile */
    .g-cards {
        display: grid !important;
        grid-template-columns: repeat(2, 1fr);
        gap: 12px;
        overflow-x: visible;
        cursor: auto;
    }
    .g-card {
        min-width: unset;
    }
    .g-card__flag {
        margin-bottom: 10px;
    }
    .g-card__name {
        font-size: 11px;
    }
    .g-card__amount {
        font-size: 17px;
    }

    /* Hide scroll arrow on mobile */
    .g-cards__arrow {
        display: none !important;
    }

    /* Quick actions - 2 column on mobile */
    .g-actions {
        grid-template-columns: repeat(2, 1fr);
        gap: 10px;
    }
    .g-action {
        padding: 14px;
    }
    .g-action__icon {
        width: 36px;
        height: 36px;
        font-size: 18px;
    }
    .g-action__name {
        font-size: 12px;
    }
    .g-action__desc {
        font-size: 10.5px;
    }

    /* Section title */
    .g-sec-title {
        font-size: 14px;
    }

    /* Chart */
    .g-chart {
        padding: 16px;
    }
    .g-chart__title {
        font-size: 14px;
    }

    /* Notice compact */
    .g-notice {
        padding: 10px 12px;
        gap: 10px;
    }
    .g-notice__icon {
        width: 28px;
        height: 28px;
        font-size: 12px;
    }
    .g-notice__body strong {
        font-size: 12px;
    }
    .g-notice__body span {
        font-size: 11.5px;
    }
}

/* ============================================
   SMALL MOBILE (max-width: 400px)
   ============================================ */
@media (max-width: 400px) {
    .g-balance__amount {
        font-size: 28px;
    }
    .g-balance__btns {
        gap: 18px;
    }
    .g-balance__btn-circle {
        width: 44px;
        height: 44px;
        font-size: 20px;
    }
    .g-actions {
        grid-template-columns: 1fr;
    }
    .g-card__amount {
        font-size: 15px;
    }
}
</style>
@endpush

@push('script')
    <script src="{{ asset(activeTemplate(true) . '/js/lib/apexcharts.min.js') }}"></script>

    {{-- Inject Bottom Tab Bar directly into body so it escapes all containers --}}
    <script>
    (function() {
        var tabBar = document.createElement('div');
        tabBar.className = 'g-tab-bar';
        tabBar.id = 'mobileTabBar';
        tabBar.innerHTML = ''
            + '<a href="{{ route('user.home') }}" class="g-tab-bar__item g-tab-bar__item--active">'
            + '  <i class="las la-home"></i>'
            + '  <span>Home</span>'
            + '</a>'
            + '<a href="{{ route('user.deposit.index') }}" class="g-tab-bar__item">'
            + '  <i class="las la-plus-circle"></i>'
            + '  <span>Deposit</span>'
            + '</a>'
            + '<a href="{{ route('user.withdraw') }}" class="g-tab-bar__item">'
            + '  <i class="las la-money-bill-wave"></i>'
            + '  <span>Withdraw</span>'
            + '</a>'
            + '<a href="{{ route('user.transactions') }}" class="g-tab-bar__item">'
            + '  <i class="las la-history"></i>'
            + '  <span>History</span>'
            + '</a>'
            + '<a href="{{ route('user.profile.setting') }}" class="g-tab-bar__item">'
            + '  <i class="las la-ellipsis-h"></i>'
            + '  <span>More</span>'
            + '</a>';
        document.body.appendChild(tabBar);

        // Highlight current page
        var currentPath = window.location.pathname;
        var items = tabBar.querySelectorAll('.g-tab-bar__item');
        items.forEach(function(item) {
            item.classList.remove('g-tab-bar__item--active');
            if (item.getAttribute('href') && currentPath.indexOf(item.getAttribute('href').replace(window.location.origin, '')) !== -1) {
                // partial match
            }
        });
        // Always set Home as active on dashboard
        if (currentPath.indexOf('/user/dashboard') !== -1 || currentPath === '/user' || currentPath === '/user/') {
            items[0].classList.add('g-tab-bar__item--active');
        } else if (currentPath.indexOf('/deposit') !== -1) {
            items[1].classList.add('g-tab-bar__item--active');
        } else if (currentPath.indexOf('/withdraw') !== -1) {
            items[2].classList.add('g-tab-bar__item--active');
        } else if (currentPath.indexOf('/transactions') !== -1) {
            items[3].classList.add('g-tab-bar__item--active');
        } else {
            items[4].classList.add('g-tab-bar__item--active');
        }
    })();
    </script>

    <script>
        // Horizontal scroll for balance cards (desktop only)
        (function() {
            const container = document.getElementById('balanceCards');
            const scrollBtn = document.getElementById('scrollRight');

            if (scrollBtn && container) {
                scrollBtn.addEventListener('click', function() {
                    container.scrollBy({ left: 200, behavior: 'smooth' });
                });

                function checkScroll() {
                    // Only enable on desktop (not grid mode)
                    if (window.innerWidth <= 991) {
                        scrollBtn.style.display = 'none';
                        return;
                    }
                    if (container.scrollWidth <= container.clientWidth) {
                        scrollBtn.style.display = 'none';
                    } else {
                        scrollBtn.style.display = 'flex';
                    }
                }
                checkScroll();
                window.addEventListener('resize', checkScroll);

                // Drag to scroll (desktop only)
                let isDown = false;
                let startX;
                let scrollLeft;

                container.addEventListener('mousedown', (e) => {
                    if (window.innerWidth <= 991) return;
                    isDown = true;
                    container.style.cursor = 'grabbing';
                    startX = e.pageX - container.offsetLeft;
                    scrollLeft = container.scrollLeft;
                });
                container.addEventListener('mouseleave', () => {
                    isDown = false;
                    container.style.cursor = 'grab';
                });
                container.addEventListener('mouseup', () => {
                    isDown = false;
                    container.style.cursor = 'grab';
                });
                container.addEventListener('mousemove', (e) => {
                    if (!isDown) return;
                    e.preventDefault();
                    const x = e.pageX - container.offsetLeft;
                    const walk = (x - startX) * 2;
                    container.scrollLeft = scrollLeft - walk;
                });
            }
        })();

        // Apex chart
        var options = {
            chart: {
                height: 350,
                type: "area",
                toolbar: { show: false },
                dropShadow: {
                    enabled: true,
                    enabledSeries: [0],
                    top: -2, left: 0, blur: 10, opacity: 0.08,
                },
                animations: {
                    enabled: true,
                    easing: 'linear',
                    dynamicAnimation: { speed: 1000 }
                },
            },
            dataLabels: { enabled: false },
            series: [{
                name: "Price",
                data: [
                    @foreach ($chartData as $cData)
                        {{ getAmount($cData->amount) }},
                    @endforeach
                ]
            }],
            fill: {
                type: "gradient",
                colors: ['#4c7de6', '#4c7de6', '#4c7de6'],
                gradient: {
                    shadeIntensity: 1,
                    opacityFrom: 0.6,
                    opacityTo: 0.9,
                    stops: [0, 90, 100]
                }
            },
            xaxis: {
                title: "Value",
                categories: [
                    @foreach ($chartData as $cData)
                        "{{ Carbon\Carbon::parse($cData->date)->format('d F') }}",
                    @endforeach
                ]
            },
            grid: {
                padding: { left: 5, right: 5 },
                xaxis: { lines: { show: false } },
                yaxis: { lines: { show: false } },
            },
        };

        var chart = new ApexCharts(document.querySelector("#chart"), options);
        chart.render();

        @if ($isHoliday)
            function createCountDown(elementId, sec) {
                var tms = sec;
                var x = setInterval(function() {
                    var distance = tms * 1000;
                    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                    var days = `<span>${days}d</span>`;
                    var hours = `<span>${hours}h</span>`;
                    var minutes = `<span>${minutes}m</span>`;
                    var seconds = `<span>${seconds}s</span>`;
                    document.getElementById(elementId).innerHTML = days + ' ' + hours + " " + minutes + " " + seconds;
                    if (distance < 0) {
                        clearInterval(x);
                        document.getElementById(elementId).innerHTML = "COMPLETE";
                    }
                    tms--;
                }, 1000);
            }
            createCountDown('counter', {{ abs(\Carbon\Carbon::parse($nextWorkingDay)->diffInSeconds()) }});
        @endif

        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })
    </script>
@endpush
