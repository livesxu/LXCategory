//Static Table

#import <UIKit/UIKit.h>
#import "TableSimpleSection.h"
#import "UITableViewCell+TableSimpleCell.h"

typedef void(^LXTableSimpleSectionBlock)(TableSimpleSection *section,NSUInteger sectionIndex);

@interface TableViewSimple : UITableView

@property (nonatomic, strong) NSMutableArray *sectionsArray;

- (void)addSection:(LXTableSimpleSectionBlock)sectionBlock;

@end
