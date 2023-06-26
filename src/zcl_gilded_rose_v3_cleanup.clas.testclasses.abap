*& Test Code - Currently Broken
CLASS ltc_gilded_rose DEFINITION FINAL FOR TESTING RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    METHODS:
      _01_decrease_quality_and_time  FOR TESTING,
      _02_quality_is_never_negative  FOR TESTING,
      _03_brie_increases_inquality   FOR TESTING,
      _04_quality_never_more_than_50 FOR TESTING,
      _05_sulfuras_is_invariant      FOR TESTING,
      _06_backstage_passes_increase  FOR TESTING,
      _07_backstage_passes_le_10days FOR TESTING,
      _08_backstage_passes_le_5days  FOR TESTING,
      _09_backstage_passes_outofdate FOR TESTING,
      _10_conjured_items_degrade_2X  FOR TESTING.
    .
ENDCLASS.

CLASS ltc_gilded_rose IMPLEMENTATION.



  METHOD _01_decrease_quality_and_time.

    " Given
    DATA(lt_expected_items) = VALUE lcl_gilded_rose=>tt_items(
                    ( NEW #( iv_name    = |+5 Dexterity Vest|
                             iv_sell_in = 9
                             iv_quality = 19 ) ) ).
    DATA(lt_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |+5 Dexterity Vest|
                                 iv_sell_in = 10
                                 iv_quality = 20 ) ) ).

    " When
    DATA(lo_app) = NEW lcl_gilded_rose( it_items = lt_items ).
    lo_app->update_quality( ).

    " Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = lt_items[ 1 ]->description(  )
        exp = lt_expected_items[ 1 ]->description(  ) ).


  ENDMETHOD.

  METHOD _02_quality_is_never_negative.

    " Given
    DATA(lt_expected_items) = VALUE lcl_gilded_rose=>tt_items(
                    ( NEW #( iv_name    = |+5 Dexterity Vest|
                             iv_sell_in = 9
                             iv_quality = 0 ) ) ).
    DATA(lt_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |+5 Dexterity Vest|
                                 iv_sell_in = 10
                                 iv_quality = 0 ) ) ).

    " When
    DATA(lo_app) = NEW lcl_gilded_rose( it_items = lt_items ).
    lo_app->update_quality( ).

    " Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = lt_items[ 1 ]->description(  )
        exp = lt_expected_items[ 1 ]->description(  ) ).

  ENDMETHOD.

  METHOD _03_brie_increases_inquality.
    " Given
    DATA(lt_expected_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Aged Brie|
                                 iv_sell_in = 1
                                 iv_quality = 5 ) ) ).
    DATA(lt_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Aged Brie|
                                 iv_sell_in = 2
                                 iv_quality = 4 ) ) ).

    " When
    DATA(lo_app) = NEW lcl_gilded_rose( it_items = lt_items ).
    lo_app->update_quality( ).

    " Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = lt_items[ 1 ]->description(  )
        exp = lt_expected_items[ 1 ]->description(  ) ).

  ENDMETHOD.

  METHOD _04_quality_never_more_than_50.

    " Given
    DATA(lt_expected_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Aged Brie|
                                 iv_sell_in = 1
                                 iv_quality = 50 ) ) ).
    DATA(lt_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Aged Brie|
                                 iv_sell_in = 2
                                 iv_quality = 50 ) ) ).

    " When
    DATA(lo_app) = NEW lcl_gilded_rose( it_items = lt_items ).
    lo_app->update_quality( ).

    " Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = lt_items[ 1 ]->description(  )
        exp = lt_expected_items[ 1 ]->description(  ) ).

  ENDMETHOD.



  METHOD _05_sulfuras_is_invariant.

    " Given
    DATA(lt_expected_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Sulfuras, Hand of Ragnaros|
                                 iv_sell_in = 0
                                 iv_quality = 80 ) ) ).
    DATA(lt_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Sulfuras, Hand of Ragnaros|
                                 iv_sell_in = 0
                                 iv_quality = 80 ) ) ).

    " When
    DATA(lo_app) = NEW lcl_gilded_rose( it_items = lt_items ).
    lo_app->update_quality( ).

    " Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = lt_items[ 1 ]->description(  )
        exp = lt_expected_items[ 1 ]->description(  ) ).


  ENDMETHOD.

  METHOD _06_backstage_passes_increase.

    " Given
    DATA(lt_expected_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 14
                                 iv_quality = 21 ) ) ).
    DATA(lt_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 15
                                 iv_quality = 20 ) ) ).

    " When
    DATA(lo_app) = NEW lcl_gilded_rose( it_items = lt_items ).
    lo_app->update_quality( ).

    " Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = lt_items[ 1 ]->description(  )
        exp = lt_expected_items[ 1 ]->description(  ) ).


  ENDMETHOD.

  METHOD _07_backstage_passes_le_10days.

    " Given
    DATA(lt_expected_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 9
                                 iv_quality = 22 ) ) ).
    DATA(lt_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 10
                                 iv_quality = 20 ) ) ).

    " When
    DATA(lo_app) = NEW lcl_gilded_rose( it_items = lt_items ).
    lo_app->update_quality( ).

    " Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = lt_items[ 1 ]->description(  )
        exp = lt_expected_items[ 1 ]->description(  ) ).


  ENDMETHOD.

  METHOD _08_backstage_passes_le_5days.

    " Given
    DATA(lt_expected_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 4
                                 iv_quality = 23 ) ) ).
    DATA(lt_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 5
                                 iv_quality = 20 ) ) ).

    " When
    DATA(lo_app) = NEW lcl_gilded_rose( it_items = lt_items ).
    lo_app->update_quality( ).

    " Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = lt_items[ 1 ]->description(  )
        exp = lt_expected_items[ 1 ]->description(  ) ).

  ENDMETHOD.

  METHOD _09_backstage_passes_outofdate.
    " Given
    DATA(lt_expected_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = -1
                                 iv_quality = 0 ) ) ).
    DATA(lt_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 0
                                 iv_quality = 20 ) ) ).

    " When
    DATA(lo_app) = NEW lcl_gilded_rose( it_items = lt_items ).
    lo_app->update_quality( ).

    " Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = lt_items[ 1 ]->description(  )
        exp = lt_expected_items[ 1 ]->description(  ) ).
  ENDMETHOD.

  METHOD _10_conjured_items_degrade_2x.
    " Given
    DATA(lt_expected_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Conjured Mana Cake|
                                 iv_sell_in = 2
                                 iv_quality = 4 ) ) ).
    DATA(lt_items) = VALUE lcl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |Conjured Mana Cake|
                                 iv_sell_in = 3
                                 iv_quality = 6 ) ) ).

    " When
    DATA(lo_app) = NEW lcl_gilded_rose( it_items = lt_items ).
    lo_app->update_quality( ).

    " Then
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act = lt_items[ 1 ]->description(  )
        exp = lt_expected_items[ 1 ]->description(  ) ).

  ENDMETHOD.

ENDCLASS.
