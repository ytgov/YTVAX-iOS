//
//  String+Ext.swift
//  YukonVaccinationVerifier
//
//  Created by Mohamed Afsar on 02/11/21.
//

import Foundation

internal extension String {
    static var yukonVaccinationVerifier: String { LanguageService.dynamicLocalizedString("View.Label.YukonVaccinationVerifier")
    }
    static var weNeedPermission_QRcode: String { LanguageService.dynamicLocalizedString("View.Label.WeNeedPermission...QRcode")
    }
    static var noCameraAccess: String { LanguageService.dynamicLocalizedString("View.Label.NoCameraAccess")
    }
    static var camera_UseThisApp: String { LanguageService.dynamicLocalizedString("View.Label.Camera...UseThisApp")
    }
    static var fullyVaccinated: String { LanguageService.dynamicLocalizedString("View.Label.FullyVaccinated")
    }
    static var officialGovernmentOfYukonResult: String { LanguageService.dynamicLocalizedString("View.Label.OfficialGovernmentOfYukonResult")
    }
    static var partiallyVaccinated: String { LanguageService.dynamicLocalizedString("View.Label.PartiallyVaccinated")
    }
    static var noRecordsFound: String { LanguageService.dynamicLocalizedString("View.Label.NoRecordsFound")
    }
    static var pleaseUpdate: String { LanguageService.dynamicLocalizedString("View.Label.PleaseUpdate")
    }
    static var aNewVersion_AppStore: String { LanguageService.dynamicLocalizedString("View.Label.ANewVersion...AppStore")
    }
    static var COVIDInfoTitle: String {
        LanguageService.dynamicLocalizedString("View.Label.CovidInfo")
    }
    static var dataCollectionTitle: String {
        LanguageService.dynamicLocalizedString("View.Label.DataCollectionNotice")
    }
    
    static var startScanning: String { LanguageService.dynamicLocalizedString("View.Action.StartScanning")
    }
    static var ok: String {
        LanguageService.dynamicLocalizedString("View.Action.Ok")
    }
    static var scanNext: String {
        LanguageService.dynamicLocalizedString("View.Action.ScanNext")
    }
    
    static var covidInfoURL: String {
        LanguageService.dynamicLocalizedString("View.URL.Covid19Info")
    }
    
    static var dataCollectionURL: String {
        LanguageService.dynamicLocalizedString("View.URL.DataCollection")
    }
    
    static var there_codesInView: String {
        LanguageService.dynamicLocalizedString("View.Error.There...codesInView")
    }
    static var invalidQRCode: String {
        LanguageService.dynamicLocalizedString("View.Error.InvalidQRCode")
    }
    static var scanOfficialQR: String {
        LanguageService.dynamicLocalizedString("View.Error.scanOfficialQR")
    }
    static var unsupportedDevice: String {
        LanguageService.dynamicLocalizedString("View.Error.UnsupportedDevice")
    }
    static var please_supportsVideoCapture: String {
        LanguageService.dynamicLocalizedString("View.Error.Please...SupportsVideoCapture")
    }
    static var yourDevice_scanning: String {
        LanguageService.dynamicLocalizedString("View.Error.YourDevice...scanning")
    }
}
