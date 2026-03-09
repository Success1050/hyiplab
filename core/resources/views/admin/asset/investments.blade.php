@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card b-radius--10 ">
                <div class="card-body p-0">
                    <div class="table-responsive--md  table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('User')</th>
                                    <th>@lang('Asset')</th>
                                    <th>@lang('Amount')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Date')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($investments as $investment)
                                    <tr>
                                        <td>
                                            <span class="fw-bold">{{ $investment->user->fullname }}</span>
                                            <br>
                                            <span class="small">
                                                <a href="{{ route('admin.users.detail', $investment->user_id) }}"><span>@</span>{{ $investment->user->username }}</a>
                                            </span>
                                        </td>
                                        <td>
                                            <span class="fw-bold">{{ __($investment->assetCategory->name) }}</span>
                                        </td>
                                        <td>
                                            {{ showAmount($investment->amount) }}
                                        </td>
                                        <td>
                                            @if($investment->status == 0)
                                                <span class="badge badge--warning">@lang('Pending')</span>
                                            @elseif($investment->status == 1)
                                                <span class="badge badge--success">@lang('Active')</span>
                                            @else
                                                <span class="badge badge--danger">@lang('Closed')</span>
                                            @endif
                                        </td>
                                        <td>
                                            {{ showDateTime($investment->created_at) }}<br>{{ diffForHumans($investment->created_at) }}
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-outline--primary statusBtn" 
                                                data-id="{{ $investment->id }}" 
                                                data-status="{{ $investment->status }}">
                                                <i class="la la-check-circle"></i> @lang('Update Status')
                                            </button>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table><!-- table end -->
                    </div>
                </div>
                @if ($investments->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($investments) }}
                    </div>
                @endif
            </div><!-- card end -->
        </div>
    </div>

    <div class="modal fade" id="statusModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Update Investment Status')</h5>
                    <button type="button" class="close" data-bs-dismiss="modal">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.asset.investment.status') }}" method="post">
                    @csrf
                    <input type="hidden" name="id">
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('Status')</label>
                            <select name="status" class="form-control" required>
                                <option value="0">@lang('Pending')</option>
                                <option value="1">@lang('Active')</option>
                                <option value="2">@lang('Closed')</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        (function($) {
            "use strict"
            let modal = $('#statusModal');

            $('.statusBtn').on('click', function() {
                modal.find('input[name=id]').val($(this).data('id'));
                modal.find('select[name=status]').val($(this).data('status'));
                modal.modal('show');
            });

        })(jQuery);
    </script>
@endpush
