<div class="filter">
  <div class="filter-name"><?=$messG['Фільтр']?></div>
  <form action="" method="get">
    <div class="add-field-filter icon-plus"></div>
    <div class="filter-option-list">
      <?php foreach($info_block['setting_column'] as $k => $value){
        if($value['view_filter']){
          echo '<div class="'.(isset($_COOKIE['filter']) && in_array($value['index'], (array)json_decode($_COOKIE['filter']))? 'act-option' : '').'" data-index="'.(int)$value['index'].'">'.$value['name'].'</div>';
        }
      } ?>
    </div>
    <?=$info_block['html_filter']?>
    <input type="submit" name="filter" value="<?=$messG['Пошук']?>">
    <a href="/admin/setting/info-block/?filterReset=ok"><?=$messG['Відмінити']?></a>
  </form>
</div>

<div class="section-interface-k1">
  <div class="line-custom">
    <p class="header-name"><?=$mess['Типи інформаційних блоків']?></p>
  </div>

  <form action="" method="post" onsubmit="return okFrom();">
    <div class="line-custom-next">
      <a href="/admin/setting/info-block/?add=ok" class="add-el icon-plus"><?=$mess['Додати новий тип']?></a>
      <input type="submit" value="<?=$messG['Активувати']?>" name="activate" class="option-el">
      <input type="submit" value="<?=$messG['Деактивувати']?>" name="deactivate" class="option-el">
      <input type="submit" value="<?=$messG['Видалити']?>" name="delete" class="option-el">
      <div class="dynamicEdit" data-submit-lang="<?=$messG['Зберегти'].'|'.$messG['Відмінити']?>"></div>
    </div>

    <table class="illustration-table">
      <tr>
        <td><input type="checkbox" name="all_cheked"></td>
        <td></td>
        <?php foreach($info_block['column_list'] as $k => $v){
          if($info_block['setting_column'][$v]['view_table']){ ?>
            <td><?=$info_block['setting_column'][$v]['name']?></td>
          <?php }
        } ?>
      </tr>

      <?php if($info_block['result_DB']->num_rows > 0){
        while($arResult = hsc($info_block['result_DB']->fetch_assoc())){ ?>
          <tr data-id="<?=$arResult['id']?>">
            <td><input type="checkbox" name="ids[]" value="<?=$arResult['id']?>"></td>
            <td class="relative">
              <span class="icon-mob-menu" onclick="openMenuUpdate(this);"></span>
              <div class="menu-update">
                <a href="/admin/setting/info-block/?edit=<?=$arResult['id']?>"><?=$messG['Редагувати']?></a>
                <a href="/admin/setting/info-block/?delete=<?=$arResult['id']?>"><?=$messG['Видалити']?></a>
              </div>
            </td>
            <?php foreach($arResult as $k => $value){
              if($info_block['setting_column'][$k]['view_table']){ ?>
                <td <?=(($info_block['setting_column'][$k]['edit_window'] == 1)? 'data-field="'.$k.'"' : '')?>><?=(($info_block['setting_column'][$k]['field'] == 'tinyint')? $messG[$k][$value] : $value)?></td>
              <?php }
            } ?>
          </tr>
        <?php }
      } else { ?>
        <tr>
          <td>-</td>
          <td>-</td>
          <?php foreach($info_block['setting_column'] as $k => $v){
            if($v['view_table']){ ?>
              <td>-</td>
            <?php }
          } ?>
        </tr>
      <?php } ?>
    </table>
  </form>

  <div class="bottom-table">
    <?=$info_block['count_el_page']?>
    <?=$info_block['pagination']?>
  </div>
</div>