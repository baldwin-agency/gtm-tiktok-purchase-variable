___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Baldwin GA4 Transaction to TikTok Transaction",
  "description": "Pulls transaction data for TikTok from GA4 event",
  "categories": ["ADVERTISING", "ANALYTICS", "CONVERSIONS", "MARKETING", "PERSONALIZATION", "SOCIAL"],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const copyFromDataLayer = require('copyFromDataLayer');

const ecommerceData = copyFromDataLayer('ecommerce') || {};
const eventType = copyFromDataLayer('event') || {};

let tikTokPurchaseEventData = {};

if (eventType === 'purchase') {
  tikTokPurchaseEventData.value = ecommerceData.value;
  tikTokPurchaseEventData.currency = ecommerceData.currency;
  tikTokPurchaseEventData.contents = [];
  ecommerceData.items.map(item => {
    tikTokPurchaseEventData.contents.push({
      'content_id': item.item_id,
      'content_type': 'product',
      'content_name': item.item_name,
      'quantity': item.quantity,
      'price': item.price
    });
  });
}

return tikTokPurchaseEventData;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "ecommerce.*"
              },
              {
                "type": 1,
                "string": "event.*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 3/27/2023, 2:48:51 PM


