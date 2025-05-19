import { Feature, FeatureNumberInput, FeatureChoiced, FeatureShortTextInput } from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const reagent_name: Feature<string> = {
  name: 'Label of Prescription',
  component: FeatureShortTextInput,
};

export const application_method: FeatureChoiced = {
  name: 'Method of Application',
  component: FeatureDropdownInput,
};


export const item_amount: Feature<number> = {
  name: 'Prescribed Amount',
  component: FeatureNumberInput,
};

export const reagent_amount: Feature<number> = {
  name: 'Units Per',
  component: FeatureNumberInput,
};
