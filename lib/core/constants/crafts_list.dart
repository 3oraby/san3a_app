import 'package:san3a_app/core/constants/locale_keys.dart';

class CraftsList {
  const CraftsList._();

  static List<String> crafts = [
    LocaleKeys.craftCarpenter,
    LocaleKeys.craftPlumber,
    LocaleKeys.craftElectrician,
    LocaleKeys.craftBlacksmith,
    LocaleKeys.craftPainter,
    LocaleKeys.craftPlasterer,
    LocaleKeys.craftWallFinisher,
    LocaleKeys.craftTailor,
    LocaleKeys.craftDressmaker,
    LocaleKeys.craftHairdresser,
    LocaleKeys.craftBarber,
    LocaleKeys.craftCarMechanic,
    LocaleKeys.craftHeavyEquipmentMechanic,
    LocaleKeys.craftTinSmith,
    LocaleKeys.craftAirConditionTechnician,
    LocaleKeys.craftRefrigerationTechnician,
    LocaleKeys.craftWashingMachineTechnician,
    LocaleKeys.craftRefrigeratorTechnician,
    LocaleKeys.craftWaterHeaterTechnician,
    LocaleKeys.craftElevatorTechnician,
  ];

  static List<String> constructionCrafts = [
    LocaleKeys.craftBuilder,
    LocaleKeys.craftContractor,
    LocaleKeys.craftSiteSupervisor,
    LocaleKeys.craftFinishingTechnician,
    LocaleKeys.craftGypsumBoardTechnician,
    LocaleKeys.craftCeramicTechnician,
    LocaleKeys.craftMarbleTechnician,
    LocaleKeys.craftParquetTechnician,
    LocaleKeys.craftFacadeTechnician,
    LocaleKeys.craftInsulationTechnician,
    LocaleKeys.craftSuspendedCeilingTechnician,
  ];

  static List<String> maintenanceCrafts = [
    LocaleKeys.craftGeneralMaintenance,
    LocaleKeys.craftWaterNetworkTechnician,
    LocaleKeys.craftElectricNetworkTechnician,
    LocaleKeys.craftAlarmTechnician,
    LocaleKeys.craftCctvTechnician,
    LocaleKeys.craftNetworkTechnician,
    LocaleKeys.craftSmartSystemsTechnician,
    LocaleKeys.craftSolarEnergyTechnician,
  ];

  static List<String> vehicleCrafts = [
    LocaleKeys.craftDriver,
    LocaleKeys.craftHeavyDriver,
    LocaleKeys.craftEquipmentDriver,
    LocaleKeys.craftDeliveryDriver,
    LocaleKeys.craftCarMechanic,
    LocaleKeys.craftMotorcycleTechnician,
    LocaleKeys.craftTireTechnician,
    LocaleKeys.craftBatteryTechnician,
  ];

  static List<String> furnitureCrafts = [
    LocaleKeys.craftFurnitureTechnician,
    LocaleKeys.craftFurnitureDesigner,
    LocaleKeys.craftUpholsterer,
    LocaleKeys.craftCurtainTechnician,
    LocaleKeys.craftKitchenTechnician,
    LocaleKeys.craftBedroomTechnician,
  ];

  static List<String> homeServices = [
    LocaleKeys.craftCleaner,
    LocaleKeys.craftCleaningCompany,
    LocaleKeys.craftBabysitter,
    LocaleKeys.craftNanny,
    LocaleKeys.craftCook,
    LocaleKeys.craftHouseHelper,
    LocaleKeys.craftBuffetWorker,
  ];

  static List<String> publicServices = [
    LocaleKeys.craftSecurityGuard,
    LocaleKeys.craftBuildingGuard,
    LocaleKeys.craftDoorman,
    LocaleKeys.craftGarageWorker,
    LocaleKeys.craftWarehouseWorker,
  ];

  static List<String> allCrafts = [
    ...crafts,
    ...constructionCrafts,
    ...maintenanceCrafts,
    ...vehicleCrafts,
    ...furnitureCrafts,
    ...homeServices,
    ...publicServices,
    LocaleKeys.craftOther,
  ];
}
