<?php
namespace Users;

// Add these import statements:
use Users\Model\User;
use Users\Model\UserTable;
use Zend\Db\ResultSet\ResultSet;
use Zend\Db\TableGateway\TableGateway;

class Module
{
    public function getConfig(){
        return include __DIR__ . '/config/module.config.php';
    }

	public function getAutoloaderConfig() {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }
    /*
    public function getServiceConfig() {
		return array(
			'factories' => array(
				'Users\Model\UserTable' => function($sm) {
					$tableGateway = $sm->get('UserTableGateway');
					$table = new UserTable($tableGateway);
					return $table;
				},
				'UserTableGateway' => function ($sm) {
					$dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
					$resultSetPrototype = new ResultSet();
					$resultSetPrototype->setArrayObjectPrototype(new User());
					return new TableGateway('user', $dbAdapter, null, $resultSetPrototype);
				},
			),
		);
	} */

	public function getServiceConfig()
    {
        return array(
            'factories' => array(
                'Users\Model\UserTable' =>  function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new UserTable($dbAdapter);
                    return $table;
                },
                'UserTable' =>  function($sm) {
                  $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                  $table = new UserTable($dbAdapter);
                  return $table;
              }
            ),
            
        );
    }
	
}
