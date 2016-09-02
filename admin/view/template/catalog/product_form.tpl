<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
    <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
                        <li><a href="#tab-links" data-toggle="tab"><?php echo $tab_links; ?></a></li>
                        <li><a href="#tab-special" data-toggle="tab"><?php echo $tab_special; ?></a></li>
			            <?php if ($product_id) { ?>
                           <li><a href="#tab-parameters" data-toggle="tab"><?php echo $tab_parameters; ?></a></li>
                        <?php } ?>
                        <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
                        <li style="display:none;"><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">
                            <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
                            </ul>
                            <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                                            <?php if (isset($error_name[$language['language_id']])) { ?>
                                                <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                                        <div class="col-sm-10">
                                            <textarea name="product_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="product_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                                        <div class="col-sm-10">
                                            <textarea name="product_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                                        <div class="col-sm-10">
                                            <textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                                        </div>
                                    </div>
                                </div>
                <?php } ?>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-data">
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $text_in_stock; ?></label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <?php if ($in_stock) { ?>
                                            <input type="radio"
                                                   name="in_stock"
                                                   value="1"
                                                   checked="checked" />
                                            <?php echo $text_yes; ?>
                                        <?php } else { ?>
                                            <input type="radio"
                                                   name="in_stock"
                                                   value="1" />
                                            <?php echo $text_yes; ?>
                                        <?php } ?>
                                    </label>
                                    <label class="radio-inline">
                                        <?php if (!$in_stock) { ?>
                                            <input type="radio"
                                                   name="in_stock" 
                                                   value="0" 
                                                   checked="checked" />
                                            <?php echo $text_no; ?>
                                        <?php } else { ?>
                                            <input type="radio"
                                                   name="in_stock" 
                                                   value="0" />
                                            <?php echo $text_no; ?>
                                        <?php } ?>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                                <div class="col-sm-10">
                                    <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                    <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                                </div>
                            </div>            
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-article"><?php echo $entry_article; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="article" value="<?php echo $article; ?>" placeholder="<?php echo $entry_article; ?>" id="input-article" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                                <div class="col-sm-10">
                                    <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                    <?php if ($error_keyword) { ?>
                                    <div class="text-danger"><?php echo $error_keyword; ?></div>
                    <?php } ?>               
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-links">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" 
                                       for="input-category">
                                    <?php echo $entry_category; ?>
                                </label>
                                <div class="col-sm-10">
                                    <input type="text" 
                                           name="category" 
                                           value="" 
                                           placeholder="<?php echo $entry_category; ?>" 
                                           id="input-category" 
                                           class="form-control" />
                                    <div id="product_category" 
                                         class="well well-sm" 
                                         style="height: 150px; overflow: auto;">
                                        <?php foreach ($product_categories as $key => $product_category) { ?>
                                            <div id="product_category<?php echo $product_category['category_id']; ?>">
                                                <i onclick="deleteCategory('<?php echo $product_category['category_id']; ?>');"
                                                    class="fa fa-minus-circle"></i> 
                                                <?php echo $product_category['name']; ?>
                                                <input type="hidden" 
                                                       name="product_categories[<?php echo $key ?>][category_id]" 
                                                       value="<?php echo $product_category['category_id']; ?>" />
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                                <div class="col-sm-10">
                                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                                        <div class="checkbox">
                                            <label>
                                            <?php if (in_array(0, $product_store)) { ?>
                                                <input type="checkbox" name="product_store[]" value="0" checked="checked" />
                                                <?php echo $text_default; ?>
                                            <?php } else { ?>
                                                <input type="checkbox" name="product_store[]" value="0" />
                                                    <?php echo $text_default; ?>
                                            <?php } ?>
                                            </label>
                                        </div>
                                        <?php foreach ($stores as $store) { ?>
                                        <div class="checkbox">
                                            <label>
                                                <?php if (in_array($store['store_id'], $product_store)) { ?>
                                                <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                                                <?php echo $store['name']; ?>
                                                <?php } else { ?>
                                                <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />
                                                <?php echo $store['name']; ?>
                                                <?php } ?>
                                            </label>
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>  
                        </div>
                        <?php if ($product_id) { ?>
                            <div class="tab-pane" id="tab-parameters">
                                <div class="row">
                                    <div class="col-sm-10">
                                        <div class="tab-content">
                                        <?php foreach ($product_parameters as $parameter) { ?>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="input-status">
                                                    <?php echo $parameter['name']; ?>
                                                </label>
                                                <div class="col-sm-10">
                                                        <select name="product_parameters[<?php echo $parameter['param_id'] ?>][]" id="input-status" class="form-control">
                                                            <option>--Не выбрано--</option>
                                                            <?php foreach ($parameter['param_values'] as $value) { ?>
                                                            <?php if (in_array($value['param_value_id'], $product_param)) { ?>
                                                            <option value="<?php echo $value['param_value_id']; ?>"
                                                                    selected="selected">
                                                                <?php echo $value['value']; ?>
                                                            </option>
                                                            <?php } else { ?>
                                                            <option value="<?php echo $value['param_value_id']; ?>">
                                                                <?php echo $value['value']; ?>
                                                            </option>
                                                            <?php } ?>
                                                            <?php } ?>
                                                        </select>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                        <div class="tab-pane" id="tab-special">
                            <div class="table-responsive">
                                <table id="special" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <td class="text-right"><?php echo $entry_priority; ?></td>
                                            <td class="text-right"><?php echo $entry_price; ?></td>
                                            <td class="text-left"><?php echo $entry_date_start; ?></td>
                                            <td class="text-left"><?php echo $entry_date_end; ?></td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $special_row = 0; ?>
                                        <?php foreach ($product_specials as $product_special) { ?>
                                            <tr id="special-row<?php echo $special_row; ?>">
                                                <td class="text-left" style="display:none;">
                                                    <select name="product_special[<?php echo $special_row; ?>][customer_group_id]" class="form-control">
                                                        <option value="1">1</option>
                                                    </select>
                                                </td>
                                                <td class="text-right">
                                                    <input type="text" 
                                                           name="product_special[<?php echo $special_row; ?>][priority]" 
                                                           value="<?php echo $product_special['priority']; ?>" 
                                                           placeholder="<?php echo $entry_quantity; ?>" 
                                                           class="form-control" />
                                                </td>
                                                <td class="text-right">
                                                    <input type="text" 
                                                           name="product_special[<?php echo $special_row; ?>][price]" 
                                                           value="<?php echo $product_special['price']; ?>" 
                                                           placeholder="<?php echo $entry_price; ?>" 
                                                           class="form-control" />
                                                </td>
                                                <td class="text-left" style="width: 20%;">
                                                    <div class="input-group date">
                                                        <input type="text" 
                                                               name="product_special[<?php echo $special_row; ?>][date_start]" 
                                                               value="<?php echo $product_special['date_start']; ?>" 
                                                               placeholder="<?php echo $entry_date_start; ?>" 
                                                               data-date-format="YYYY-MM-DD" 
                                                               class="form-control" />
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </td>
                                                <td class="text-left" style="width: 20%;">
                                                    <div class="input-group date">
                                                        <input type="text" 
                                                               name="product_special[<?php echo $special_row; ?>][date_end]" 
                                                               value="<?php echo $product_special['date_end']; ?>" 
                                                               placeholder="<?php echo $entry_date_end; ?>" 
                                                               data-date-format="YYYY-MM-DD" 
                                                               class="form-control" />
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </td>
                                                <td class="text-left">
                                                    <button type="button" 
                                                            onclick="$('#special-row<?php echo $special_row; ?>').remove();" 
                                                            data-toggle="tooltip" 
                                                            title="<?php echo $button_remove; ?>" 
                                                            class="btn btn-danger">
                                                        <i class="fa fa-minus-circle"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                            <?php $special_row++; ?>
                                        <?php } ?>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="4"></td>
                                            <td class="text-left"><button type="button" onclick="addSpecial();" data-toggle="tooltip" title="<?php echo $button_special_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-image">
                            <div class="table-responsive">
                                <table id="images" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <td class="text-left"><?php echo $entry_image; ?></td>
                                            <td class="text-right"><?php echo $entry_sort_order; ?></td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                    <?php $image_row = 0; ?>
                    <?php foreach ($product_images as $product_image) { ?>
                                        <tr id="image-row<?php echo $image_row; ?>">
                                            <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                                            <td class="text-right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
                                            <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                        </tr>
                    <?php $image_row++; ?>
                    <?php } ?>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="2"></td>
                                            <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>

                        <div class="tab-pane" id="tab-design" style="display:none;">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <td class="text-left"><?php echo $entry_store; ?></td>
                                            <td class="text-left"><?php echo $entry_layout; ?></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-left"><?php echo $text_default; ?></td>
                                            <td class="text-left"><select name="product_layout[0]" class="form-control">
                                                    <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>
                                                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                                                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                                                </select></td>
                                        </tr>
                    <?php foreach ($stores as $store) { ?>
                                        <tr>
                                            <td class="text-left"><?php echo $store['name']; ?></td>
                                            <td class="text-left"><select name="product_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                                                    <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>
                                                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                                                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                                                </select></td>
                                        </tr>
                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript"><!--
  <?php foreach ($languages as $language) { ?>
                                                $('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
  <?php } ?>
                                                //--></script> 
    <script type="text/javascript"><!--

        // Category
        $('#input-category').autocomplete({
            'source': function (request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                    dataType: 'json',
                    success: function (json) {
                        response($.map(json, function (item) {
                            return {
                                label: item['name'],
                                value: item['category_id']
                            };
                        }));
                    }
                });
            },
            'select': function (item) {
                
                $('input[name=\'category\']').val('');

                $('#product_category' + item['value']).remove();

                $('#product_category').append('<div id="product_category' + item['value'] + '"><i onclick="deleteCategory(' + item['value'] + ');" class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_categories[' + item['value'] + '][category_id]" value="' + item['value'] + '" /></div>');
            
                $('#input-main-category').append('<option id="main_' + item['value'] + '" value="' + item['value'] + '">' + item['label'] + '</option>');
            }
        });


        function deleteCategory(category_id) {
            $('#product_category' + category_id).remove();
            $('#input-main-category #main_' + category_id).remove();
        }


        //--></script>

    <script type="text/javascript"><!--
        var special_row = <?php echo $special_row; ?>;

        function addSpecial() {
            html = '<tr id="special-row' + special_row + '">';
            html += '  <td class="text-left" style="display:none;"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
            html += '      <option selected value="1">1</option>';
            html += '  </select></td>';
            html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
            html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
            html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
            html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';

            $('#special tbody').append(html);

            $('.date').datetimepicker({
                pickTime: false
            });

            special_row++;
        }
        //--></script> 
    <script type="text/javascript"><!--
        var image_row = <?php echo $image_row; ?>;

        function addImage() {
            html = '<tr id="image-row' + image_row + '">';
            html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
            html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
            html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
            html += '</tr>';

            $('#images tbody').append(html);

            image_row++;
        }
        //--></script> 

    <script type="text/javascript"><!--
        $('.date').datetimepicker({
            pickTime: false
        });

        $('.time').datetimepicker({
            pickDate: false
        });

        $('.datetime').datetimepicker({
            pickDate: true,
            pickTime: true
        });
        //--></script> 
    <script type="text/javascript"><!--
        $('#language a:first').tab('show');
        $('#option a:first').tab('show');
        //--></script></div>
<?php echo $footer; ?> 