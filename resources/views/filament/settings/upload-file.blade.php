<div>
    <x-filament::breadcrumbs :breadcrumbs="[
        '/' => 'Home',
        '/admin' => 'Dashboard',
        '/admin/countries' => 'Countries',
    ]" />


    <div class="flex justify-between mt-1">
        <div class=""></div>
        {{ $data }}
    </div>

    <div class="max-w-3xl mx-auto">

        <form wire:submit.prevent="save">
            <input type="file" wire:model="excelFile" class="border border-gray-300 p-2 rounded-md">

            <button type="submit"
                class="focus:outline-none text-white bg-primary-600 hover:bg-primary-600 focus:ring-4 focus:ring-primary-600 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:focus:ring-primary-600 px-3">Upload
                Excel</button>

            @error('excelFile')
                <p class=" mt-3 error fi-fo-field-wrp-error-message text-sm text-danger-600 dark:text-danger-400">
                    {{ $message }}</p>
            @enderror
        </form>

    </div>
</div>
