<?php
   class Property {
      var $ID;
      var $PostCode;
      var $TotalArea;
      var $AskingPrice;
      var $ReservedPrice;
      var $OfferPrice;
      var $SellingPrice;
      var $StampDuty;
      var $Offers;
      var $Seller;
      
   function calculateReservePrice(){
      $calc = $this->AskingPrice - ($this->AskingPrice*10)/100;
      echo "Reserve Price " .$calc. "<br>";	
      }
   
      
   function calculateStampDuty(){
            $calc2 = ($this->AskingPrice*5)/100 ;
            echo "Stamp Duty " .$calc2. "<br>";	
   }


   function calculateAgentsProfitShop(){
      $calc3 = ($this->AskingPrice*9)/100 ;
         echo "Seller Commission " .$calc3. "<br>";
   }

   function calculateAgentsProfitFlat(){
      $calc4 = ($this->AskingPrice*5)/100 ;
         echo "Seller Commission " .$calc4. "<br>";
   }

   function calculateAgentsProfitHouse(){
      $calc5 = ($this->AskingPrice*7)/100 ;
         echo "Seller Commission " .$calc5. "<br>";
   }

   function calculateTotalPricePaid(){
         $calc6 = $this->AskingPrice + $this->StampDuty;
         echo "Total Price paid ". $calc6 . "<br>";
      }
    function __construct($ID,$AskingPrice,$StampDuty) {
    $this->ID = $ID; 
    $this->AskingPrice = $AskingPrice; 
    $this->StampDuty = $StampDuty; 
  }
  function get_ID() {
    return $this->ID;
  }
  function get_AskingPrice() {
    return $this->AskingPrice;
  }
  function get_StampDuty() {
   return $this->StampDuty;
 }
}

$property1 = new Property(1,900000,45000);
$property2 = new Property(2,800000,40000);
$property3 = new Property(3,300,15);
$property4 = new Property(4,2000000,100000);
$property5 = new Property(5,550000,27500);

echo "ID " . $property1->get_ID(). "<br>";
echo "Asking Price " .$property1->get_AskingPrice(). "<br>";
$property1->calculateReservePrice(). "<br>";
$property1->calculateStampDuty(). "<br>";
$property1->calculateAgentsProfitShop(). "<br>";
$property1->calculateTotalPricePaid(). "<br>";

echo "ID " .$property2->get_ID(). "<br>";
echo "Asking Price " .$property2->get_AskingPrice(). "<br>";
$property2->calculateReservePrice(). "<br>";
$property2->calculateStampDuty(). "<br>";
$property2->calculateAgentsProfitFlat(). "<br>";
$property2->calculateTotalPricePaid(). "<br>";

echo "ID " .$property3->get_ID(). "<br>";
echo "Asking Price " .$property3->get_AskingPrice(). "<br>";
$property3->calculateReservePrice(). "<br>";
$property3->calculateStampDuty(). "<br>";
$property3->calculateAgentsProfitFlat(). "<br>";
$property3->calculateTotalPricePaid(). "<br>";

echo "ID " .$property4->get_ID(). "<br>";
echo "Asking Price " .$property4->get_AskingPrice(). "<br>";
$property4->calculateReservePrice(). "<br>";
$property4->calculateStampDuty(). "<br>";
$property4->calculateAgentsProfitHouse(). "<br>";
$property4->calculateTotalPricePaid(). "<br>";

echo "ID " .$property5->get_ID(). "<br>";
echo "Asking Price " .$property5->get_AskingPrice(). "<br>";
$property5->calculateReservePrice(). "<br>";
$property5->calculateStampDuty(). "<br>";
$property5->calculateAgentsProfitFlat(). "<br>";
$property5->calculateTotalPricePaid(). "<br>";
?>