<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AssetCategory;
use App\Models\AssetInvestment;
use Illuminate\Http\Request;

class AssetController extends Controller
{
    public function categories()
    {
        $pageTitle = 'Asset Categories';
        $categories = AssetCategory::orderBy('name')->paginate(getPaginate());
        return view('admin.asset.categories', compact('pageTitle', 'categories'));
    }

    public function categoryStore(Request $request)
    {
        $request->validate([
            'name' => 'required|max:100',
            'slug' => 'required|max:100|unique:asset_categories,slug,' . $request->id,
            'icon' => 'required|max:40',
            'color' => 'required|max:20',
            'unit_label' => 'nullable|max:50',
            'price_label' => 'nullable|max:50',
            'price_per_unit' => 'nullable|numeric',
            'min_units' => 'nullable|numeric',
            'estimated_term' => 'nullable|max:100',
            'projected_return' => 'nullable|max:100',
            'return_min_pct' => 'nullable|numeric',
            'return_max_pct' => 'nullable|numeric',
            'risk_text' => 'nullable',
            'durations' => 'nullable|array',
            'durations_text' => 'nullable|max:255',
        ]);

        if ($request->id) {
            $category = AssetCategory::findOrFail($request->id);
            $notification = 'Asset category updated successfully';
        } else {
            $category = new AssetCategory();
            $notification = 'Asset category added successfully';
        }

        $category->name = $request->name;
        $category->slug = $request->slug;
        $category->icon = $request->icon;
        $category->color = $request->color;
        $durations = [];
        if ($request->durations_text) {
            $durations = array_map('trim', explode(',', $request->durations_text));
        }

        $category->details = [
            'unit_label' => $request->unit_label,
            'price_label' => $request->price_label,
            'price_per_unit' => $request->price_per_unit,
            'min_units' => $request->min_units,
            'min_capital' => $request->min_units * $request->price_per_unit,
            'estimated_term' => $request->estimated_term,
            'projected_return' => $request->projected_return,
            'return_min_pct' => $request->return_min_pct,
            'return_max_pct' => $request->return_max_pct,
            'risk_text' => $request->risk_text,
            'durations' => $durations,
        ];
        $category->status = $request->status ? 1 : 0;
        $category->save();

        $notify[] = ['success', $notification];
        return back()->withNotify($notify);
    }

    public function investments()
    {
        $pageTitle = 'Asset Investments';
        $investments = AssetInvestment::with(['user', 'assetCategory'])->orderBy('id', 'desc')->paginate(getPaginate());
        return view('admin.asset.investments', compact('pageTitle', 'investments'));
    }

    public function investmentStatus(Request $request)
    {
        $request->validate([
            'id' => 'required|integer',
            'status' => 'required|integer|in:0,1,2',
        ]);

        $investment = AssetInvestment::findOrFail($request->id);
        $investment->status = $request->status;
        $investment->save();

        $notify[] = ['success', 'Investment status updated successfully'];
        return back()->withNotify($notify);
    }
}
