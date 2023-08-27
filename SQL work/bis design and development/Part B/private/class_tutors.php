<?php

class tutors {


	static public $database;
	
	
	static public function set_database($database) {
			self::$database = $database;
		}


	static public function find_by_sql($sql){
			$results = self::$database->query($sql);
				if(!$results) {								//add valuation of the query succeded or failed
					exit("Database query failed. ");
					}
				if($results) {
					echo "Database query succeeded. <br> ";
					}
			$object_array=[];
			while($record = $results->fetch_assoc()) { //get the first row as an array and create an object
				$object_array[] = self::instantiate($record);
				}
			//$results->free;
			return $object_array;		
			}

	static public function find_all() {
			$sql = "SELECT * FROM Tutors";
			return self::find_by_sql($sql);
		} 
	
	static public function find_by_id($id) {
			$sql = "SELECT * FROM Tutors WHERE id='" . self::$database->escape_string($id) . "'"; //escape the string
			$result = self::find_by_sql($sql);
			if(!empty($result)){
				echo "not empty";
				return array_shift($result);
			} else {
				echo "empty";
			}
		} 

static protected function instantiate($record) {
			$object = new tutors;
			foreach($record as $property => $value) {
				if(property_exists($object, $property)){
					 $object->$property=$value;
					}
				}
			return $object;
		}

		
public function update() {
		$sql = "UPDATE Tutors SET ";
			$sql .= "emailAddress='".self::$database->escape_string($this->emailAddress)."', ";
			$sql .= "phoneNo='".self::$database->escape_string($this->phoneNo)."', ";
			$sql .= "tLevel='".self::$database->escape_string($this->tLevel)."', ";
			$sql .= "subjects='".self::$database->escape_string($this->subjects)."', ";
			$sql .= "ratePHour='".self::$database->escape_string($this->ratePHour)."', ";
		$sql .= "WHERE id=' ". self::$database->escape_string($this->id) . " '";

			$results = self::$database->query($sql);
			return $results;
			
		}

		
	public function delete() {
		$sql = "DELETE FROM vehicles WHERE id='" . $this->id . "' LIMIT 1"; // or id = '" . self::$database->escape_string($this->id) "'
		$results = self::$database->query($sql);
		return $results;			
		}



	public function merge_attributes($args=[]) {
			foreach($args as $key=>$value) {
					if(property_exists($this, $key)) {
							$this->$key = $value;
						}
					}
				}

public $id;
public $tutorName;
public $emailAddress;
public $phoneNo;
public $tLevel;
public $subjects;
public $ratePHour;



}




?>