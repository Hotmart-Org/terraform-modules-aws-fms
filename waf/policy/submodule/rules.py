import sys
import json

managedRules = json.loads(sys.argv[1])
ruleGroups = json.loads(sys.argv[2])
firehoseArn = sys.argv[3]

rules = []

if managedRules:
  rules += [{
    'ruleGroupArn': None,
    'ruleGroupType': 'ManagedRuleGroup',
    'overrideAction': {'type': 'COUNT' if 'action' in managedRule and managedRule['action'] == 'COUNT' else 'NONE'},
    'managedRuleGroupIdentifier': {
      'version': None if 'version' not in managedRule else managedRule['version'],
      'vendorName': managedRule['vendorName'],
      'managedRuleGroupName': managedRule['managedRuleGroupName']
    },
    'excludeRules': [] if 'excludeRules' not in managedRule else [{'name': r} for r in managedRule['excludeRules']]
  } for managedRule in managedRules]

if ruleGroups:
  rules += [{
    'ruleGroupArn': ruleGroup['arn'] if not isinstance(ruleGroup, str) else ruleGroup,
    'ruleGroupType': 'RuleGroup',
    'overrideAction': {'type': 'COUNT' if not isinstance(ruleGroup, str) and 'action' in ruleGroup and ruleGroup['action'] == 'COUNT' else 'NONE'},
    'managedRuleGroupIdentifier': None,
    'excludeRules': [{'name': r} for r in ruleGroup['excludeRules']] if not isinstance(ruleGroup, str) and 'excludeRules' in ruleGroup else []
  } for ruleGroup in ruleGroups]

print(json.dumps({
  'data': json.dumps({
    'type': 'WAFV2',
    'defaultAction': {'type': 'ALLOW'},
    'preProcessRuleGroups': rules,
    'postProcessRuleGroups': [],
    'overrideCustomerWebACLAssociation': True,
    'loggingConfiguration': {'logDestinationConfigs': [firehoseArn], 'redactedFields': []}
  })
}))