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
                                    <th>@lang('Name')</th>
                                    <th>@lang('Slug')</th>
                                    <th>@lang('Icon')</th>
                                    <th>@lang('Color')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($categories as $category)
                                    <tr>
                                        <td>{{ __($category->name) }}</td>
                                        <td>{{ $category->slug }}</td>
                                        <td><i class="las {{ $category->icon }} f-size--24"></i></td>
                                        <td><span class="badge badge-outline--{{ $category->color }}">{{ $category->color }}</span></td>
                                        <td>
                                            @if($category->status)
                                                <span class="badge badge--success">@lang('Active')</span>
                                            @else
                                                <span class="badge badge--danger">@lang('Inactive')</span>
                                            @endif
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-outline--primary editBtn me-1" 
                                                data-category="{{ $category }}"><i class="las la-pen"></i>@lang('Edit')</button>
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
            </div><!-- card end -->
        </div>
    </div>

    <div class="modal fade" id="categoryModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Add New Category')</h5>
                    <button type="button" class="close" data-bs-dismiss="modal">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.asset.category.store') }}" method="post">
                    @csrf
                    <input type="hidden" name="id">
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('Name')</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="form-group">
                            <label>@lang('Slug')</label>
                            <input type="text" class="form-control" name="slug" required>
                            <small class="text-muted">@lang('Used for URLs')</small>
                        </div>
                        <div class="form-group">
                            <label>@lang('Icon Class') (LineAwesome)</label>
                            <input type="text" class="form-control" name="icon" placeholder="e.g. la-building" required>
                        </div>
                        <div class="form-group">
                            <label>@lang('Color Class')</label>
                            <select name="color" class="form-control" required>
                                <option value="emerald">Emerald</option>
                                <option value="amber">Amber</option>
                                <option value="indigo">Indigo</option>
                                <option value="rose">Rose</option>
                                <option value="primary">Primary</option>
                                <option value="info">Info</option>
                                <option value="success">Success</option>
                                <option value="warning">Warning</option>
                                <option value="danger">Danger</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>@lang('Unit Label')</label>
                            <input type="text" class="form-control" name="unit_label" placeholder="e.g. Units, Barrels, Shares">
                        </div>
                        <div class="form-group">
                            <label>@lang('Price Label')</label>
                            <input type="text" class="form-control" name="price_label" placeholder="e.g. Price per Unit, Cost per Barrel">
                        </div>
                        <div class="form-group">
                            <label>@lang('Price per Unit')</label>
                            <input type="number" step="any" class="form-control" name="price_per_unit">
                        </div>
                        <div class="form-group">
                            <label>@lang('Minimum Units')</label>
                            <input type="number" class="form-control" name="min_units">
                        </div>
                        <div class="form-group">
                            <label>@lang('Estimated Term')</label>
                            <input type="text" class="form-control" name="estimated_term" placeholder="e.g. 12 - 36 Months">
                        </div>
                        <div class="form-group">
                            <label>@lang('Projected Return Text')</label>
                            <input type="text" class="form-control" name="projected_return" placeholder="e.g. 10% to 15%">
                        </div>
                        <div class="form-group">
                            <label>@lang('Minimum Return %')</label>
                            <input type="number" step="any" class="form-control" name="return_min_pct">
                        </div>
                        <div class="form-group">
                            <label>@lang('Maximum Return %')</label>
                            <input type="number" step="any" class="form-control" name="return_max_pct">
                        </div>
                        <div class="form-group">
                            <label>@lang('Risk Acknowledgment Text')</label>
                            <textarea class="form-control" name="risk_text" rows="2"></textarea>
                        </div>
                        <div class="form-group">
                            <label>@lang('Available Durations') (comma separated)</label>
                            <input type="text" class="form-control" name="durations_text" placeholder="12 Months, 24 Months">
                        </div>
                        <div class="form-group">
                            <label>@lang('Status')</label>
                            <input type="checkbox" data-width="100%" data-onstyle="-success" data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('Active')" data-off="@lang('Inactive')" name="status">
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

@push('breadcrumb-plugins')
    <button class="btn btn-outline--primary btn-sm addBtn"><i class="las la-plus"></i> @lang('Add New')</button>
@endpush

@push('script')
    <script>
        (function($) {
            "use strict"
            let modal = $('#categoryModal');

            $('.addBtn').on('click', function() {
                modal.find('.modal-title').text("@lang('Add New Category')");
                modal.find('input[name=id]').val('');
                modal.find('form')[0].reset();
                modal.modal('show');
            });

            $('.editBtn').on('click', function() {
                let category = $(this).data('category');
                modal.find('.modal-title').text("@lang('Edit Category')");
                modal.find('input[name=id]').val(category.id);
                modal.find('input[name=name]').val(category.name);
                modal.find('input[name=slug]').val(category.slug);
                modal.find('input[name=icon]').val(category.icon);
                modal.find('select[name=color]').val(category.color);
                
                if(category.details){
                    modal.find('input[name=unit_label]').val(category.details.unit_label);
                    modal.find('input[name=price_label]').val(category.details.price_label);
                    modal.find('input[name=price_per_unit]').val(category.details.price_per_unit);
                    modal.find('input[name=min_units]').val(category.details.min_units);
                    modal.find('input[name=estimated_term]').val(category.details.estimated_term);
                    modal.find('input[name=projected_return]').val(category.details.projected_return);
                    modal.find('input[name=return_min_pct]').val(category.details.return_min_pct);
                    modal.find('input[name=return_max_pct]').val(category.details.return_max_pct);
                    modal.find('textarea[name=risk_text]').val(category.details.risk_text);
                    
                    if(category.details.durations){
                        modal.find('input[name=durations_text]').val(category.details.durations.join(', '));
                    }
                }

                if(category.status == 1){
                    modal.find('input[name=status]').bootstrapToggle('on');
                }else{
                    modal.find('input[name=status]').bootstrapToggle('off');
                }

                modal.modal('show');
            });

        })(jQuery);
    </script>
@endpush
